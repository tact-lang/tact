struct NestedStrOpt {
  s: String?;
}
contract CombineNestedSimpleOptional {
  f: NestedStrOpt = NestedStrOpt{ s: null };

  init() {
    self.f = NestedStrOpt{ s: "ok" };
  }
}
