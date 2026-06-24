struct Rec1 {
  v1: Int;
}

struct Rec2 {
  v2: Rec1;
}

struct Rec3 {
  v3: Rec2;
}

contract RecTest {
  deep: Rec3;

  init() {
    self.deep = Rec3{
      v3: Rec2{
        v2: Rec1{v1: 777}
      }
    };
  }
}