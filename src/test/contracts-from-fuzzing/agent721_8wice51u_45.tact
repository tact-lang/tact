struct BigInner {
    a: Int; b: Int; c: Int; d: Int; e: Int; f: Int; g: Int; h: Int;
}

struct BigOuter {
  i: BigInner;
  j: BigInner;
}

contract DoubleBig {
  f: BigOuter = BigOuter{
    i: BigInner{a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8},
    j: BigInner{a:9,b:10,c:11,d:12,e:13,f:14,g:15,h:16}
  };
}