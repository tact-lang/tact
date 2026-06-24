// Nested contract variables partially void init assignment
struct Info {
  a: Int;
  b: Bool?;
  s: String;
}

contract PartialAssign {
  data: Info;
  init() {
    self.data = Info{
      a: 100,
      s: "str"
    };
  }
}