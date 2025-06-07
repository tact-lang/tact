struct SubNested {
  s: String;
  optInt: Int?;
  flag: Bool;
}

struct ComplexNested {
  intVal: Int;
  flag2: Bool?;
  sub: SubNested;
}

contract TestContract {
  data: ComplexNested;

  init() {
    self.data = ComplexNested{
      intVal: 11,
      flag2: null,
      sub: SubNested{
        s: "hello",
        optInt: null,
        flag: true
      }
    };
  }
}