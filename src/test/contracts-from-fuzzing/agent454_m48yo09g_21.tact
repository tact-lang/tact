struct Small {
  flag: Bool;
}
struct Medium {
  s: Small;
  n: Int;
}
struct Large {
  m: Medium;
  txt: String;
}

contract CompositeNested {
  val: Large;
  init() {
    self.val = Large{
      m: Medium{ s: Small{flag:true}, n:5 },
      txt: "hello"
    };
  }
}