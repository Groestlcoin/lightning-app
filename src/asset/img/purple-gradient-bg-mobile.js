import React from 'react';
import Svg, { Defs, LinearGradient, Stop, Path } from '../../component/svg';

const SvgComponent = props => (
  <Svg width={600} height={'100%'} {...props}>
    <Defs>
      <LinearGradient x1="-6.471%" y1="-1%" x2="87.82%" y2="84.696%" id="a">
        <Stop stopColor="#00A5BD" offset="0%" />
        <Stop stopColor="#006593" offset="51.576%" />
        <Stop stopColor="#00618F" offset="70.302%" />
        <Stop stopColor="#00618F" offset="70.302%" />
        <Stop stopColor="#005E78" offset="100%" />
      </LinearGradient>
    </Defs>
    <Path d="M0 0h600v1000H0z" fill="url(#a)" fillRule="evenodd" />
  </Svg>
);

export default SvgComponent;
