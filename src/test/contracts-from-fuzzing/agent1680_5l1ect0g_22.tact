struct Flags {
  flag1: Bool;
  flag2: Bool;
  flag3: Bool;
  flag4: Bool;
}

contract TestContract {
  f: Flags;

  init() {
    self.f = Flags{flag1:true, flag2:false, flag3:true, flag4:false};
  }
}