struct Rec1 {
  val: Int;
}

struct Rec2 {
  val: Rec1;
}

struct Rec3 {
  val: Rec2;
}

struct Rec4 {
  val: Rec3;
}

struct Rec5 {
  val: Rec4;
}

contract LongChain {
  chain: Rec5;

  init() {
    self.chain = Rec5{val: Rec4{val: Rec3{val: Rec2{val: Rec1{val: 42}}}}};
  }
}