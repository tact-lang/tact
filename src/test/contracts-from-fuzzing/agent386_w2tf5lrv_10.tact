struct SubSub {
  xx: Int;
}

struct Sub {
  ss: SubSub;
}

struct MainS {
  sub: Sub;
}

contract NestedChain {
  m: MainS = MainS{sub: Sub{ss: SubSub{xx: 1}}};

  init() {
    self.m = MainS{sub: Sub{ss: SubSub{xx: 777}}};
  }
}
