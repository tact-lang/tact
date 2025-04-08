struct Big {
  a1:Int;a2:Int;a3:Int;a4:Int;a5:Int;
  a6:Int;a7:Int;a8:Int;a9:Int;a10:Int;
}

struct Nested {
  b1: Int;
  b2: Big;
  b3: String;
}

contract Test {
  x: Big;
  y: Nested;

  init() {
    self.x = Big{a1:1,a2:2,a3:3,a4:4,a5:5,a6:6,a7:7,a8:8,a9:9,a10:10};
    self.y = Nested{
      b1: 42,
      b2: self.x,
      b3: "hello"
    };
  }

  receive() {
    self.x = Big{a1:0,a2:0,a3:0,a4:0,a5:0,a6:0,a7:0,a8:0,a9:0,a10:0};
    self.y = Nested{b1:0,b2:self.x,b3:""};
  }
}
