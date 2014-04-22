function [change, max_abs_change] = calculate_point_source_scat_term(k, a, c, m, n, everything, eta, xi, phi, eta0, xi0, xi1, imped)
	if (m == 0)
		epsilon = 1.0;
	else
		epsilon = 2.0;
	end
	if (strcmp(imped, 'soft'))
		temp = interp1(everything.R.xi, everything.R.R1, xi1, 'spline') / interp1(everything.R.xi, everything.R.R1 + 1i * everything.R.R2, xi1, 'spline');
	else
		temp = interp1(everything.R.xi, everything.R.R1p, xi1, 'spline') / interp1(everything.R.xi, everything.R.R1p + 1i * everything.R.R2p, xi1, 'spline');
	end
	change = ...
	-((1i * k) / (2.0 * pi)) * ...
	epsilon * ...
	interp1(everything.S1.eta, everything.S1.S1, eta0, 'spline') * ...
	interp1(everything.R.xi, everything.R.R1 + 1i * everything.R.R2, xi0, 'spline') * ...
	temp * ...
	interp1(everything.S1.eta, everything.S1.S1, eta, 'spline') .* ...
	interp1(everything.R.xi, everything.R.R1 + 1i * everything.R.R2, xi, 'spline') .* ...
	cos(m * phi);
	max_abs_change = max(abs(change(xi >= xi1)));
end
