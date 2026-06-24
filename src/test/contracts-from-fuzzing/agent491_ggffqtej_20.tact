struct ManyNumeric {
  a: Int as int8;
  b: Int as int16;
  c: Int as int32;
  d: Int as int64;
  e: Int as uint8;
  f: Int as uint16;
  g: Int as uint32;
  h: Int as uint64;
}

contract NumContract {
  nums: ManyNumeric;

  init() {
    self.nums = ManyNumeric{ a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8 };
  }
}
