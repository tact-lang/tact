struct SubSub {
  subsub1: Int;
  subsub2: Bool;
}

struct Sub {
  inner1: Int;
  inner2: Bool;
  deep: SubSub;
}

contract NestedMany {
  data: Sub;
  init() {
    self.data = Sub{
      inner1: 12,
      inner2: true,
      deep: SubSub{ subsub1: 99, subsub2: false }
    };
  }
}