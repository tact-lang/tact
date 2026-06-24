struct Rec1 {
  i: Int;
}

struct Rec2 {
  r1: Rec1;
  s: String;
}

struct Rec3 {
  r2: Rec2;
  b: Bool;
  i2: Int;
}

contract SerialTest {
  content: Rec3;

  init() {
    self.content = Rec3{
      r2: Rec2{
        r1: Rec1{ i: 13 },
        s: "abc"
      },
      b: true,
      i2: 777
    };
  }
}