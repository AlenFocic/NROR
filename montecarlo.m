function montecarlo()
    stTock = 10000;
    r = 1;
    [ocenjenoPi, napaka] = area_pi(stTock, r);
    disp(['Ocenjeno π: ', num2str(ocenjenoPi)]);
    disp(['Napaka: ', num2str(napaka)]);
    risi(stTock, r);
end

function [ocenjenoPi, napaka] = area_pi(stTock, r)
    znotrajKroga = 0;
    for i = 1:stTock
        x = 2 * rand() - 1;
        y = 2 * rand() - 1;
        if x^2 + y^2 <= r^2
            znotrajKroga = znotrajKroga + 1;
        end
    end
    ocenjenoPi = 4 * znotrajKroga / stTock;
    napaka = abs(ocenjenoPi - pi);
end

function risi(stTock, r)
    x = 2 * rand(stTock, 1) - 1;
    y = 2 * rand(stTock, 1) - 1;
    razdalja = sqrt(x.^2 + y.^2);
    Znotraj = razdalja <= r;
    Zunaj = razdalja > r;
    scatter(x(Znotraj), y(Znotraj), 50, 'r', 'filled');
    hold on;
    scatter(x(Zunaj), y(Zunaj), 50, 'b', 'x');
    kroznica(r);
    axis equal;
    title('Naključno generirane točke v polju krožnice');
    xlabel('os ki sliši na ime X');
    ylabel('os ki sliši na ime Y');
    legend('Notranjost krožnice', 'Zunnjost krožnice', 'Krožnica');
end

function kroznica(r)
    kot = linspace(0, 2 * pi, 1000);
    x = r * cos(kot);
    y = r * sin(kot);
    plot(x, y, 'g', 'LineWidth', 2);
end
