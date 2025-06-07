struct Base {
  val: Int;
  flag: Bool;
  note: String;
  opt: Int?;
}

contract MultiPersistent {
  a: Base;
  b: Base;
  c: Base;
  d: Base;

  init() {
    self.a = Base{ val:1, flag:true, note:"x", opt:null };
    self.b = Base{ val:2, flag:false, note:"y", opt:5 };
    self.c = Base{ val:3, flag:true, note:"z", opt:null };
    self.d = Base{ val:4, flag:true, note:"w", opt:7 };
  }
}
