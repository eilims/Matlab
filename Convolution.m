% Notice how much more efficent the conv function is when you run the
% script.

for q = 1:10000:100000
    x = 0:q;

    y1 = x;
    y2 = -x + q;

    fprintf('Running test for %d samples\n', q);
    
    % So fast!
    fprintf('--Conv function\n');
    tic
    y3 = conv(y2, y1); 
    toc

    %plot(x,y1,x,y2)
    %figure
    %plot(1:2*q+1, y3)

    y4 = zeros(1, size(y1,2) + size(y2,2) - 1);

    % Ouchie! Super slow!
    fprintf('--For loop\n');
    tic
    for i = 1:size(y4,2)
        for o = 1:size(y1,2)
            if((i-o+1)<=size(y2,2) && i-o+1 > 0)
                y4(i) = y4(i) + y1(o) * y2(i-o+1);
            end
        end
    end
    toc
    
    %figure
    %plot(1:2*q+1, y4)
    fprintf('\n')
end

