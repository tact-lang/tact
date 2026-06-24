struct Deeply {
  nested: Middle;
}

struct Middle {
  leaf: Bottom;
}

struct Bottom {
  flag: Bool;
  count: Int;
}

contract DeepChain {
  d: Deeply;
  init() {
    self.d = Deeply{ nested: Middle{ leaf: Bottom{ flag:true, count:9 }}};
  }
}