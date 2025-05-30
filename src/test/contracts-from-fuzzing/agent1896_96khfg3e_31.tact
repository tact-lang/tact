struct BoolIntMix {
  flag: Bool;
  intVal: Int;
}

struct OuterStruct {
  inside: BoolIntMix;
  outsideVal: Int;
}

contract NestedInnerMix {
  data: OuterStruct;

  init() {
    self.data = OuterStruct{
      inside: BoolIntMix{
        flag: true,
        intVal: 99
      },
      outsideVal: 100
    };
  }
}