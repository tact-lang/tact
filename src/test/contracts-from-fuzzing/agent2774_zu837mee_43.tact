// struct with large number of Int fields with various serializations
struct ManyInts {
  a: Int as uint4;
  b: Int as int8;
  c: Int as uint12;
  d: Int as uint16;
  e: Int as int23;
  f: Int as uint32;
  g: Int as int48;
  h: Int as uint64;
}

contract TestContract {
  val: ManyInts;

  init() {
    self.val = ManyInts{
      a:1,b:-2,c:3,d:4,e:-5,f:6,g:-7,h:8
    };
  }
}