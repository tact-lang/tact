// Contract with a struct containing both optionals and nested struct
struct NestedDeeper {
  flag: Bool;
}

struct ComplexStruct {
  intVal: Int;
  optInt: Int?;
  inner: NestedDeeper;
  optBool: Bool?;
}

contract MixedDeep {
  complex: ComplexStruct;

  init() {
    self.complex = ComplexStruct{
      intVal: 42,
      optInt: null,
      inner: NestedDeeper{flag:true},
      optBool: null
    };
  }
}
