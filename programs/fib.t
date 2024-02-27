! Print fibonacci sequence
! Nils M Holm
! Public domain / 0BSD license

use t3x: t;

var ntoa_buf::100;

ntoa(x) do var i, k;
	if (x = 0) return "0";
	i := 0;
	k := x<0-> -x: x;
	while (k > 0) do
		i := i+1;
		k := k/10;
	end
	i := i+1;
	if (x < 0) i := i+1;
	ntoa_buf::i := 0;
	k := x<0-> -x: x;
	while (k > 0) do
		i := i-1;
		ntoa_buf::i := '0' + k mod 10;
		k := k/10;
	end
	if (x < 0) do
		i := i-1;
		ntoa_buf::i := '-';
	end
	return @ntoa_buf::i;
end

str_length(s) return t.memscan(s, 0, 32767);

writes(s) t.write(T3X.SYSOUT, s, str_length(s));

fib(n) do var r1, r2, i, x;
	r1 := 0;
	r2 := 1;
	for (i=1, n) do
		x := r2;
		r2 := r2 + r1;
		r1 := x;
	end
	return r2;
end 

do var i, b::3;
	for (i=1, 11) do
		writes("fib(");
		writes(ntoa(i));
		writes(") = ");
		writes(ntoa(fib(i)));
		writes(t.newline(b));
	end
end
