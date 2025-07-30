// Struct with a nested struct that has many optional fields
struct SubOpt {
  a: Int?;
  b: Bool?;
  s: String?;
}

struct TopOpt {
  inner: SubOpt;
  flag: Bool;
}

contract ManyNestedOptionals {
  data: TopOpt;

  init() {
    self.data = TopOpt{
      inner: SubOpt{
        a: null,
        b: true,
        s: null
      },
      flag: false
    };
  }
}