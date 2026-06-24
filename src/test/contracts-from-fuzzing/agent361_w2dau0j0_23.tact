struct HasBoolOpt {
  flag: Bool?;
}

struct ContainsOpt {
  inner: HasBoolOpt;
}

contract OptionalBoolInside {
  x: ContainsOpt;
  init() {
    self.x = ContainsOpt{ inner: HasBoolOpt{ flag:null } };
  }
}
