clc;
clear all;


fprintf('Loading and Visualizing 3D Cat Data ...\n')
load('3D_Cat.mat');

figure();
plot3(model(1,:),model(2,:),model(3,:),'r.',source(1,:),source(2,:),source(3,:),'b.'), hold on, axis equal
plot3([1 1 0],[0 1 1],[0 0 0],'r-',[1 1],[1 1],[0 1],'r-','LineWidth',2)
title('Original data points (blue) and model points (red)')



[ TR,TT,source ] = icp( model,source,0.0001 );

figure();
plot3(model(1,:),model(2,:),model(3,:),'r.',source(1,:),source(2,:),source(3,:),'b.'), hold on, axis equal
plot3([1 1 0],[0 1 1],[0 0 0],'r-',[1 1],[1 1],[0 1],'r-','LineWidth',2)
title('Original data points (blue) and model points (red)')






fprintf('Loading and Visualizing 3D Cat Noise Data ...\n')
load('3D_Cat_Noise.mat');

figure();
plot3(model(1,:),model(2,:),model(3,:),'r.',source(1,:),source(2,:),source(3,:),'b.'), hold on, axis equal
plot3([1 1 0],[0 1 1],[0 0 0],'r-',[1 1],[1 1],[0 1],'r-','LineWidth',2)
title('Original data points (blue) and model points (red)')



[ TR,TT,source ] = icp( model,source,0.0001 );

figure();
plot3(model(1,:),model(2,:),model(3,:),'r.',source(1,:),source(2,:),source(3,:),'b.'), hold on, axis equal
plot3([1 1 0],[0 1 1],[0 0 0],'r-',[1 1],[1 1],[0 1],'r-','LineWidth',2)
title('Original data points (blue) and model points (red)')
