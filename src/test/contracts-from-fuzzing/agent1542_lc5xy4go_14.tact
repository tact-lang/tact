struct RecursiveDefaults {
  a: Int = 1;
  nested: RecursiveDefaultsOpt? = null;
}

struct RecursiveDefaultsOpt {
  b: Int = 2;
}

contract DefaultsDeep {
  data: RecursiveDefaults;
  init(){
    self.data = RecursiveDefaults{};
  }
}