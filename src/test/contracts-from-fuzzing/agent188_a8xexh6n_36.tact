struct SComp {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract PersistentStructOptInitialized {
  val: SComp = SComp{a: 1, b: null, c: null};

  init() {
    self.val = SComp{a:5,b:true,c:"abc"};
  }
}