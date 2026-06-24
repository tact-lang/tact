struct Rec1 {
 a: Int;
}

struct Rec2 {
 b: Int;
 inner: Rec1;
}

struct Rec3 {
 c: Int;
 inner: Rec2;
}

struct Rec4 {
 d: Int;
 inner: Rec3;
}

contract RecursiveStructs {
  data: Rec4;
  init() {
    self.data = Rec4{
      d:4,
      inner: Rec3{
        c:3,
        inner: Rec2{
          b:2,
          inner: Rec1{ a:1 }
        }
      }
    };
  }
}