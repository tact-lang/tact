struct Rec1 {
  r2: Rec2;
}

struct Rec2 {
  r3: Rec3;
}

struct Rec3 {
  intf: Int;
}

contract ThreeDeep {
  inner: Rec1;
  init() {
    self.inner = Rec1{r2:Rec2{r3:Rec3{intf:42}}};
  }
}