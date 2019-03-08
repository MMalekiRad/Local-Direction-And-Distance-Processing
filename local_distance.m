clc
clear
clc
clear
%%select a method

Antkhab=menu('Select an option','Enter the manual','select the file','choose of Figure','Default in app');

switch Antkhab
    
    case 1
    
distance_points=input('Enter the data: ');
 
    case 2
 
 distance_points=input('Load file this commond (textread, xlsread, dlmread) :')
    case 3
distance_points = getline;

    case 4
        
  distance_points = textread('default-data.txt');  
   
  
  otherwise
      
   disp('You did not select any options!');
  
end

orgin_data = distance_points;
len_points=length(distance_points);
telo =input('Enter the telo: ');
i = 1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x1= distance_points(i,1);
x2= distance_points(end,1);
y1= distance_points(i,2);
y2= distance_points(end,2);
start_end = [x1 y1; x2 y2];
dist_start_end=sqrt(((x2-x1)^2)+((y2-y1)^2));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if telo > dist_start_end
    disp(start_end);
else
    while (true)
        if i ~= len_points-1
            x1= distance_points(i,1);
            x2= distance_points(i+1,1);
            y1= distance_points(i,2);
            y2= distance_points(i+1,2);
            d = sqrt(((x2-x1)^2)+((y2-y1)^2));
            
            if d < telo
                distance_points(i+1, :) = [];
                len_points = length(distance_points);
            else
                i = i+1;
            end
            
        else
            break;
        end
    end
    disp(distance_points);
end
for i=1:length(distance_points)
    plot(distance_points(i,1),distance_points(i,2),'r*-')
    hold on
end
%legend('r==data_B && g=orgin_data');
for i=1:length(distance_points)-1
    line([distance_points(i,1),distance_points(i+1,1)],[distance_points(i,2) distance_points(i+1,2)])
end

plot(orgin_data(:,1),(orgin_data(:,2)),'-.yo')
hold on     
 