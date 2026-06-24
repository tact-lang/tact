struct Flags {
  f1: Bool;
  f2: Bool;
  f3: Bool;
  f4: Bool;
  f5: Bool;
}

contract ManyFlags {
  data: Flags;

  init() {
    self.data = Flags{ f1:true, f2:false, f3:true, f4:false, f5:true };
  }
}