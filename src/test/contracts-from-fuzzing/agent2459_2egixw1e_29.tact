message(77) LeafMsg {
  data: Int;
}

struct MidLevel {
  lm: LeafMsg?;
}

struct TopLevel {
  mid: MidLevel?;
}

contract TestContract {
  val: TopLevel;

  init() {
    self.val = TopLevel{ mid: null };
  }
}