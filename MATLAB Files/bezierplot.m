function drawer = bezier(b,c,d)

 points1 = [0 0 2 0 2 3 0 3;    %Letter B
           0 0 0 0 0 0 0 6;
           0 3 2 3 2 6 0 6];
      
 points2 = [-6 0 -10 0 -10 6 -6 6];  %Letter C   

 points3 = [6 0 9 0 9 6 6 6;     %Letter D
           6 0 6 2 6 4 6 6];
 
%  half_size_b = points1/2;
%  half_size_c = points2/2;
   half_size_d = points3/2;
   double_size_b = points1*2;
   double_size_c = points2*2;
   double_size_d = points3*2;
    
   C = {points2 double_size_b double_size_d};
   
%  C = {yoda yoda2 yoda3}; 
%  C = {half_size_b points2 points3};
 for x = 1:3
    [rows, ~] = size(C{x});
     val = C{x};
     for row = 1:rows
        % Grabs first row of matrix
        row_value = val(row,:)
        % Grabs value from of the matrix
        x(1)= row_value(1);
        y(1)= row_value(2);
        x(2) = row_value(3);
        y(2) = row_value(4);
        x(3) = row_value(5);
        y(3) = row_value(6);
        x(4) = row_value(7);
        y(4) = row_value(8);

       %Calculate the coefficients    
        t = 0:.02:1;
        bx = 3*(x(2)-x(1));
        cx = 3*(x(3) - x(2))- bx;
        dx = x(4)-x(1)-bx-cx;
        by = 3*(y(2)-y(1));
        cy = 3*(y(3)-y(2));
        dy = y(4)-y(1)-by-cy;

        xp = x(1) + t.*(bx+t.*(cx+t*dx));
        yp = y(1) + t.*(by+t.*(cy+t*dy));
        hold on
        graph = plot(xp,yp,'LineWidth',4,'color','k');
        xlim([-20,20]);
        %pause(2);
%         hold off
     end
        pause(2.5);
        %delete(graph);   
        hold off
%         cla reset;
 end

end