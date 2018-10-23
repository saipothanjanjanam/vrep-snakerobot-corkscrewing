% For closing previous programs and screens
close all
clear all
clc
%Remote api start and connection start
disp('Program started');
vrep=remApi('remoteApi');
vrep.simxFinish(-1);
clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);

if (clientID>-1)
   
     t = 0;
    %Function handles for our snake actuators.
    [returnCode, verlink1] = vrep.simxGetObjectHandle(clientID, 'snake_joint_v1', vrep.simx_opmode_blocking); 
    [returnCode, verlink2] = vrep.simxGetObjectHandle(clientID, 'snake_joint_v2', vrep.simx_opmode_blocking);
    [returnCode, verlink3] = vrep.simxGetObjectHandle(clientID, 'snake_joint_v3', vrep.simx_opmode_blocking);
    [returnCode, verlink4] = vrep.simxGetObjectHandle(clientID, 'snake_joint_v4', vrep.simx_opmode_blocking);
    [returnCode, horlink1] = vrep.simxGetObjectHandle(clientID, 'snake_joint_h1', vrep.simx_opmode_blocking);
    [returnCode, horlink2] = vrep.simxGetObjectHandle(clientID, 'snake_joint_h2', vrep.simx_opmode_blocking);
    [returnCode, horlink3] = vrep.simxGetObjectHandle(clientID, 'snake_joint_h3', vrep.simx_opmode_blocking);
    [returnCode, horlink4] = vrep.simxGetObjectHandle(clientID, 'snake_joint_h4', vrep.simx_opmode_blocking);
    while 1
     % Code for Snake Corkscrewing motion 
     t = t + 1;
     [returnCode] = vrep.simxSetJointTargetPosition(clientID, verlink1,0.30*sin((1.5*(3.14*t)/12)+((2*3.14))/3), vrep.simx_opmode_blocking);
     [returnCode] = vrep.simxSetJointTargetPosition(clientID, horlink1,0.60*sin((1.5*(3.14*t)/6)+((8*3.14))/3), vrep.simx_opmode_blocking);
     [returnCode] = vrep.simxSetJointTargetPosition(clientID, verlink2,0.30*sin((1.5*(3.14*t)/12)+((4*3.14))/3), vrep.simx_opmode_blocking);
     [returnCode] = vrep.simxSetJointTargetPosition(clientID, horlink2,0.60*sin((1.5*(3.14*t)/6)+((6*3.14))/3), vrep.simx_opmode_blocking);
     [returnCode] = vrep.simxSetJointTargetPosition(clientID, verlink3,0.30*sin((1.5*(3.14*t)/12)+((6*3.14))/3), vrep.simx_opmode_blocking);
     [returnCode] = vrep.simxSetJointTargetPosition(clientID, horlink3,0.60*sin((1.5*(3.14*t)/6)+((4*3.14))/3), vrep.simx_opmode_blocking);
     [returnCode] = vrep.simxSetJointTargetPosition(clientID, verlink4,0.30*sin((1.5*(3.14*t)/12)+((8*3.14))/3), vrep.simx_opmode_blocking);    
     [returnCode] = vrep.simxSetJointTargetPosition(clientID, horlink4,0.60*sin((1.5*(3.14*t)/6)+((2*3.14))/3), vrep.simx_opmode_blocking);
      
    end
%Finishing simulation
vrep.simxFinish(-1);
 
end
 
vrep.delete();

 