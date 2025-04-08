struct LargeOptionalNesting {
 field: OptionalNested;
}

struct OptionalNested {
  opt1: Int?;
  opt2: Bool?;
  opt3: Int?;
  opt4: InnerStruct?;
}

struct InnerStruct {
  deepInt: Int;
  deepBool: Bool?;
}

contract TestContract {
  x: LargeOptionalNesting;
  init() {
    self.x = LargeOptionalNesting{
      field: OptionalNested{
        opt1: null,
        opt2: null,
        opt3: 9,
        opt4: InnerStruct{
          deepInt: 5,
          deepBool: null
        }
      }
    };
  }
}