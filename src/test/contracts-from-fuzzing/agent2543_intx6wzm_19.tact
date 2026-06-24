struct SubNested {
  a: Int;
  b: String;
}

struct Nested {
  n: SubNested;
  optInt: Int?;
  flag: Bool;
}

contract NestedFields {
  data: Nested;
  init() {
    self.data = Nested{
      n: SubNested{ a:5, b:"b" },
      optInt: null,
      flag: true
    };
  }
}