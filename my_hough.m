function [H,rho,theta] = my_hough(img_edges)

% Initializing required variables

	diag_img_edges = sqrt((rows(img_edges))^2+(columns(img_edges))^2);	
	max_rho = ceil(diag_img_edges);

	% All possible rho values 
	r = [-max_rho:max_rho];
	rho=[]

	% All possible theta values
	t = [-90:90];
	theta =[]

	% The accumulator array initialized to zeroes
	H = zeros(columns(r),columns(t));

	% Iterators
	iHeight=0,iWidth=0,iTheta=0,iRho=0;

	for iWidth = [1:rows(img_edges)]
		for iHeight = [1:columns(img_edges)]
			if(img_edges(iWidth,iHeight))
				for iTheta = [0:180]
					iRho = round(iWidth*cos((iTheta*pi)/180) + iHeight*sin((iTheta*pi)/180) + max_rho);
					if(!iRho)
						iRho += 1;
					end
					iRho,iTheta
					H(iRho,(iTheta+1)) += 1;
				end
			end
		end
	end

