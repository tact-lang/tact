struct LeafOptional {
  foo: Int?;
  bar: String?;
}

struct Mid {
  leaf: LeafOptional?;
  flag: Bool;
}

contract DeepOptNull {
  root: Mid;

  init() {
    self.root = Mid{leaf:null, flag:true};
  }
}