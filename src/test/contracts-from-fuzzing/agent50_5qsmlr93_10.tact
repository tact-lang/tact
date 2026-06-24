struct Rec1 {
  f: Int;
}

struct Rec2 {
  f: Rec1;
}

struct Rec3 {
  f: Rec2;
}

struct Rec4 {
  f: Rec3;
}

struct Rec5 {
  f: Rec4;
}

contract Test {
  rec: Rec5;

  init() {
    self.rec = Rec5{
      f: Rec4{
        f: Rec3{
          f: Rec2{
            f: Rec1{ f: 42 },
          },
        },
      },
    };
  }
}