

monteCarloPiApproximation[n_] := Module[{pointsInsideCircle, totalPoints, x, y, plotPoints},
  pointsInsideCircle = 0;
  totalPoints = n;
  
  
  plotPoints = Table[
    {x, y} = {RandomReal[], RandomReal[]};
    
    
    If[x^2 + y^2 <= 1, pointsInsideCircle++];
    
    
    {x, y},
    {n}
  ];

  
  piApproximation = 4.0 * pointsInsideCircle / totalPoints;

  
  Print["Aproksimacija stevila pi z ", totalPoints, " tock ", piApproximation];

  
  Graphics[{
    PointSize[0.02],
    Point[plotPoints],
    {Thick, Red, Circle[{0, 0}, 1, {0, Pi/2}]}
  }, Axes -> True, AxesLabel -> {"x", "y"}, PlotLabel -> "Monte Carlo aproksimacija pi"]
]

