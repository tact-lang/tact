struct Nest1 {
  iv: Int?;
  bv: Bool;
}

struct Nest2 {
  s1: Nest1;
  s2: Nest1;
}

contract DeepContract {
  val: Nest2;

  init() {
    self.val = Nest2{
      s1: Nest1{ iv: 5, bv: true },
      s2: Nest1{ iv: null, bv: false },
    };
  }
}
