function [v_in, max_abs_change] = obl_plane_wave_in(k, a, theta0, path, x, y, z)
	[ ...
	v_in, max_abs_change ...
	] = obl_calculate_sum(k, a, path, x, y, z, @(k, a, c, m, n, everything, eta, xi, phi)(calculate_plane_wave_in_term(k, a, c, m, n, everything, eta, xi, phi, theta0)));
end
