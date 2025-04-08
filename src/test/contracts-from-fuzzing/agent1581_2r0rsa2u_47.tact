struct Mix {
  flag: Bool;
  val: Int;
}

contract MultiMix {
  m1: Mix;
  m2: Mix;

  init() {
    self.m1 = Mix{ flag:true, val:1 };
    self.m2 = Mix{ flag:false, val:2 };
  }
}