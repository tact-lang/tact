struct RecNest {
  a: Int;
  sub: RecSub;
}

struct RecSub {
  flag: Bool;
  label: String;
}

contract DeepRecContract {
  r: RecNest;

  init() {
    self.r = RecNest{
      a: 10,
      sub: RecSub{flag:true,label:"abc"}
    };
  }
}