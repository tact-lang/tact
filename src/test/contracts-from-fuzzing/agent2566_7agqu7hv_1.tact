struct DeepNest {
  level: Int;
  next: SubNest;
}

struct SubNest {
  flag: Bool;
  note: String;
}

contract TestContract {
  nested: DeepNest;

  init() {
    self.nested = DeepNest{
      level: 0,
      next: SubNest{flag: false, note: ""}
    };
  }
}
