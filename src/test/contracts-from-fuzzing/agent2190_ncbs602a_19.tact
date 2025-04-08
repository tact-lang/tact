struct NestedWithOptional {
  inn: Int?;
}
struct Mid {
  nested: NestedWithOptional;
}
struct TopL {
  mid: Mid?;
}

contract OptDeepNest {
  val: TopL;
  init() {
    self.val = TopL { mid: null };
  }
}