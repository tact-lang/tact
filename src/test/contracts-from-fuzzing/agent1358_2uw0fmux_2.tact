struct Nested { foo: Int; bar: Bool; baz: String; deeper: Deeper; }
struct Deeper { n: Int; flag: Bool; s: String; }

contract DeeplyNested {
  x: Nested;

  init() {
    self.x = Nested{
      foo: 1,
      bar: false,
      baz: "hello",
      deeper: Deeper{ n: 42, flag: true, s: "deep" }
    };
  }
}