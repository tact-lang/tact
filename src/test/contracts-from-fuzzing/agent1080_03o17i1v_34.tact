struct BoolLayer {
  b1: Bool;
  b2: Bool;
  b3: Bool;
}

struct IntLayer {
  i1: Int;
  i2: Int;
}

struct SuperStruct {
  bools: BoolLayer;
  ints: IntLayer;
}

contract LayeredStruct {
  data: SuperStruct;

  init() {
    self.data = SuperStruct{
      bools: BoolLayer{ b1:true, b2:false, b3:true },
      ints: IntLayer{ i1:11, i2:22 },
    };
  }
}