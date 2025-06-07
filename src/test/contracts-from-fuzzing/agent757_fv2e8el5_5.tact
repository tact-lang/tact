struct SubInner1 { a: Int; }
struct SubInner2 { b: Int?; }

struct InnerUnion {
  left: SubInner1;
  right: SubInner2;
}

contract CombinedVariants {
  inner: InnerUnion;
  flag: Bool;
  value: Int?;

  init() {
    self.inner = InnerUnion{
      left: SubInner1{a: 123},
      right: SubInner2{b: null}
    };
    self.flag = true;
    self.value = null;
  }
}