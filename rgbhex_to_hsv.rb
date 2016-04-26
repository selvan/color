## Based on http://ntlk.net/2011/11/21/convert-rgb-to-hsb-hsv-in-ruby/
def to_hsv(html_color_code)
	r,g,b=html_color_code.split("#")[-1].scan(/../)
	r = r.to_i(16) / 255.0
	g = g.to_i(16) / 255.0
	b = b.to_i(16) / 255.0
	max = [r, g, b].max
	min = [r, g, b].min
	delta = max - min
	v = max * 100

	if (max != 0.0)
		s = delta / max *100
	else
		s = 0.0
	end

	if (s == 0.0) 
		h = 0.0
	else
		if (r == max)
			h = (g - b) / delta
		elsif (g == max)
			h = 2 + (b - r) / delta
		elsif (b == max)
			h = 4 + (r - g) / delta
		end

		h *= 60.0
		
		if (h < 0)
			h += 360.0
		end
	end

	{h: h, s: s, v: v}
end

# puts to_hsv("#ff00aa")

# (0..255).each do |r|
# 	(0..255).each do |g|
# 		(0..255).each do |b|
# 			hsv("##{r.to_s(16)}#{g.to_s(16)}#{b.to_s(16)}")
# 		end
# 	end
# end
