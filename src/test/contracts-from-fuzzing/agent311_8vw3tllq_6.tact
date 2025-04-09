struct OptionalStruct {
  s: Nested?;
}

struct Nested {
  x: Int;
  s2: Deeper;
}

struct Deeper {
  y: String;
}

contract OptionalDeep {
  data: OptionalStruct;

  init() {
    self.data = OptionalStruct{
      s: Nested{
        x: 10,
        s2: Deeper{
          y: "abc"
        }
      }
    };
  }
}