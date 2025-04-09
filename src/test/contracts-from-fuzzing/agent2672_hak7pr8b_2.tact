struct Inner { foo: Int; bar: Bool?; baz: String; }

struct Outer { s1: Inner; s2: Inner; }

contract Storage {
  nested: Outer;

  init() {
    self.nested = Outer {
      s1: Inner { foo: 1, bar: null, baz: "a" },
      s2: Inner { foo: 2, bar: true, baz: "b" }
    };
  }
}