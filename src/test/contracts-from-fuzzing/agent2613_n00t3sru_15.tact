struct V {
  a: Int;
  s: String;
}

struct Container {
  arr1: V;
  arr2: V;
  arr3: V;
  arr4: V;
}

contract LotsStructs {
  st: Container;

  init() {
    self.st = Container{
      arr1: V{a:1,s:"a"},
      arr2: V{a:2,s:"b"},
      arr3: V{a:3,s:"c"},
      arr4: V{a:4,s:"d"}
    };
  }
}