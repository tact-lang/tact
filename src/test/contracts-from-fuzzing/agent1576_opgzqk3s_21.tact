struct STop {
 x: Int; y: Int; z: Int;
}

struct SMid {
  x: STop;
  y: STop;
}

struct SDeep {
  a: SMid;
  b: SMid;
}

contract DeepCombine {
 a: SDeep;
 init() {
  self.a = SDeep{
   a: SMid{ x:STop{x:1,y:2,z:3}, y:STop{x:4,y:5,z:6} },
   b: SMid{ x:STop{x:7,y:8,z:9}, y:STop{x:10,y:11,z:12} }
  };
 }
}