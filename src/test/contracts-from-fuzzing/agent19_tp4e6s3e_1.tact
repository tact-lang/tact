struct DeepNest {
  inner: InnerStruct;
}

struct InnerStruct {
  x: Int;
  nested: MoreInner;
}

struct MoreInner {
  y: Bool;
  z: EvenDeeper;
}

struct EvenDeeper {
  flag: Bool;
}

contract TestContract {
  data: DeepNest;

  init() {
    self.data = DeepNest{
      inner: InnerStruct{
        x: 1,
        nested: MoreInner{
          y: true,
          z: EvenDeeper{flag: false}
        }
      }
    };
  }
}
