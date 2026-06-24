struct TinyPack {
  b1: Int as uint1;
  b2: Int as int1;
  b3: Int as uint2;
  b4: Int as int2;
  b5: Int as uint3;
  b6: Int as int3;
  b7: Int as uint4;
  b8: Int as int4;
}

contract TinyNest {
  pack: TinyPack;

  init() {
    self.pack = TinyPack{
      b1:1,b2:0,b3:3,b4:-1,b5:7,b6:-3,b7:15,b8:-8
    };
  }
}