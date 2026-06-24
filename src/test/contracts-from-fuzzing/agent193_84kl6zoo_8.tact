struct Mid { s: String; flag: Bool; }

struct NestedOpt {
  inner: Mid?;
}

contract InOptStruct {
  st: NestedOpt;
  
  init() {
    self.st = NestedOpt{ inner: null };
  }
}