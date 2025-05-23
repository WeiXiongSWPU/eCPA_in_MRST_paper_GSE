function q = convertTo(q, unit)
%Convert physical quantity from SI to equivalent given unit.
%
% SYNOPSIS:
%   q = convertTo(q, unit)
%
% PARAMETERS:
%   q    - Numerical array containing values of a physical quantity
%          measured in a strictly SI unit.
%
%   unit - The unit of measurement to which 'q' should be converted.
%          Assumed to be a combination of the known units in 'units'.
%
% RETURNS:
%   q    - Numerical array containing the numerical values resulting from
%          converting the input array from the SI unit to the unit of
%          measurement given by 'unit'.
%
% EXAMPLES:
%   press = convertTo(press, barsa())    % Pascal -> bar
%   rate  = convertTo(rate, stb()/day()) % m^3/s -> stb/day
%   mu    = convertTo(mu, Pa()*sec())    % Pa s -> Pa s (identity)
%
%   press = convertTo(convertFrom(press, atm()), psia()) % Atm -> psia
%
% NOTE:
%   It is the caller's responsibility to supply a 'unit' consistent with
%   the physical quantity 'q'.  Specifically, function 'convertTo' does
%   no checking of the input parameters and will, if so instructed,
%   convert the numeric value of a pressure into a time value.  Caveat
%   emptor.
%
% SEE ALSO:
%   `units`, `convertFrom`.

%{
Copyright 2009-2024 SINTEF Digital, Mathematics & Cybernetics.

This file is part of The MATLAB Reservoir Simulation Toolbox (MRST).

MRST is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

MRST is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with MRST.  If not, see <http://www.gnu.org/licenses/>.
%}

   assert (isnumeric(unit), ...
           'Unuspported ''unit'' representation ''%s''', class(unit));

   q = bsxfun(@rdivide, q, unit);
end
