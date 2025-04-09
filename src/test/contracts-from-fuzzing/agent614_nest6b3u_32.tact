struct One {
  i: Int;
  t: String;
}

struct Two {
  flag: Bool;
  opt: String?;
}

contract Mixed {
  a: One;
  b: Two;

  init() {
    self.a = One{i:123,t:"hello"};
    self.b = Two{flag:true,opt:null};
  }
}