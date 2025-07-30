struct Opts {
  o1: Int?;
  o2: Bool?;
  o3: String?;
}

struct DeepOptional {
  subopt: Opts?;
  name: String;
  flag: Bool;
}

contract OptionalStructs {
  s: DeepOptional;

  init() {
    self.s = DeepOptional{
      subopt: null,
      name: "hello",
      flag: true
    };
  }
}