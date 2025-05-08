struct Flags {
  f1: Bool;
  f2: Bool;
}

contract TestContract {
  flags: Flags;

  init() {
    self.flags = Flags{ f1:true, f2: false };
  }
}