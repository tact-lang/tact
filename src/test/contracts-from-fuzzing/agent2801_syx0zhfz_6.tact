struct Rec1 {
  a: Int = 1;
}

struct Rec2 {
  nested: Rec1;
}

struct Rec3 {
  nested: Rec2;
}

contract MultiLevel {
  top: Rec3;

  init() {
    self.top = Rec3{
      nested: Rec2{
        nested: Rec1{
          a: 1
        }
      }
    };
  }
}