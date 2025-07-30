struct SInner {
  x: Int;
}

struct SMid {
  nested: SInner;
}

struct SOuter {
  nested: SMid;
}

contract NestedFlattened {
  prop: SOuter;
  init() {
    self.prop = SOuter{
      nested: SMid{
        nested: SInner{
          x: 321
        }
      }
    };
  }
}