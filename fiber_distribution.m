A=ones(1517,6); %A used for store coordinates for 1517 fibers
x=ones(1,6); %x is the coordinate for one single fiber 
l=6; %l is the fiber length
for i=1:1517 % generating 1517 fibers
  x(1,1)=50.8*[2*rand()-1];x(1,2)=50.8*[2*rand()-1];x(1,3)=63.5*rand();%随机生成纤维一个端点的坐标，xy平面为圆形所在面，坐标原点为圆心
  r=pi*rand();a=2*pi*rand();%r为纤维与z轴夹角，a为纤维投影在xy平面的投影与x轴夹角
  x(1,4)=x(1,1)+l*sin(r)*cos(a);x(1,5)=x(1,2)+l*sin(r)*sin(a);x(1,6)=x(1,3)+l*cos(r);%x'=x+l*sinr*cosa y'=y+l*sinr*sina z'=z+l*cosr 另一个端点坐标
  if abs(x(1,4))<=50.8&&abs(x(1,5))<=50.8&&x(1,6)>=0&&x(1,6)<=63.5&&[x(1,4)^2+x(1,5)^2]<=50.8^2&&[x(1,1)^2+x(1,2)^2]<=50.8^2%判断两端点都要在基体空间内
     plot3([x(1,1) x(1,4)],[x(1,2) x(1,5)],[x(1,3) x(1,6)]);
     axis([-50.8,50.8,-50.8,50.8,0,63.5]);
     hold on;
     for k=1:6 %writing coordinates
         A(i,k)=x(1,k);
     end
  else 
     for j=1:100 % if the coordinates do not fit the requirement, repeat at most 100 times
          x(1,1)=50.8*[2*rand()-1];x(1,2)=50.8*[2*rand()-1];x(1,3)=63.5*rand();
          r=pi*rand();a=2*pi*rand();
          x(1,4)=x(1,1)+l*sin(r)*cos(a);x(1,5)=x(1,2)+l*sin(r)*sin(a);x(1,6)=x(1,3)+l*cos(r);
          if abs(x(1,4))<=50.8&&abs(x(1,5))<=50.8&&x(1,6)>=0&&x(1,6)<=63.5&&[x(1,4)^2+x(1,5)^2]<=50.8^2&&[x(1,1)^2+x(1,2)^2]<=50.8^2
             plot3([x(1,1) x(1,4)],[x(1,2) x(1,5)],[x(1,3) x(1,6)]);
            axis([-50.8,50.8,-50.8,50.8,0,63.5]);
             hold on;
             for k=1:6 %writing coordinates
             A(i,k)=x(1,k);
             end
             break;
          end
     end     
  end 
end
  fid=fopen('6-1517.txt','wt');%export coordinates to txt documents
  [m,n]=size(A);
  for i=1:m
      for j=1:n
          if j==n
              fprintf(fid,'%f\n',A(i,j));
          elseif j==0.5*n
              fprintf(fid,'%f\n',A(i,j));  
          else
               fprintf(fid,'%f\t',A(i,j));
          end
      end
  end
   fclose(fid);
   box on;
  