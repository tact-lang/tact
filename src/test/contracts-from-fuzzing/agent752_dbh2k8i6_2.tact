struct Nested {
  val1: Int;
  val2: Bool?;
  val3: String;
}

struct Outer {
  nested: Nested;
  flag: Bool;
}

contract ComplexStorage {
  record: Outer;

  init() {
    self.record = Outer{
      nested: Nested{
        val1: 1,
        val2: false,
        val3: "text"
      },
      flag: true
    };
  }
}