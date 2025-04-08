message(0x1111) MOne {
  a: Int;
}
message(0x2222) MTwo {
  a: Int;
}

struct MContainer {
  m1: MOne;
  m2: MTwo;
}

contract MessageNested {
  m: MContainer = MContainer{
    m1: MOne{a:1},
    m2: MTwo{a:2}
  };
  init() {}
}