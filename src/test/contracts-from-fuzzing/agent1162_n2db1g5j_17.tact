struct MultiOptionals {
  o1: Int?;
  o2: Bool?;
  o3: String?;
  o4: Cell?;
}

struct MultiDefaults {
  d1: Int = 1;
  d2: Bool = false;
  d3: String = "hello";
}

struct Both {
  mo: MultiOptionals;
  md: MultiDefaults;
}

contract ComplexStructFields {
  both: Both;
  init() {
    self.both = Both{
      mo: MultiOptionals{ o1:null,o2:null,o3:null,o4:null },
      md: MultiDefaults{},
    };
  }
}