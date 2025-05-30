struct Inner {
  x: Int;
}

struct MidA {
  in1: Inner;
  in2: Inner;
}

struct MidB {
  in3: Inner;
  in4: Inner;
}

struct DeepStruct {
  a: MidA;
  b: MidB;
}

contract ManyMid {
  val: DeepStruct;

  init() {
    self.val = DeepStruct{
      a: MidA{
        in1: Inner{x:1},
        in2: Inner{x:2}
      },
      b: MidB{
        in3: Inner{x:3},
        in4: Inner{x:4}
      }
    };
  }
}