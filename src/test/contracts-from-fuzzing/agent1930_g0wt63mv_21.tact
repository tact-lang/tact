struct Complex {
  foo: Int;
  bar: Bool;
  baz: Mid;
}

struct Mid {
  m1: Int;
  m2: Inner;
  m3: Bool;
}

struct Inner {
  x: Int;
  y: String;
}

contract ManyLayers {
  c: Complex;

  init() {
    self.c = Complex{
      foo: 5,
      bar: true,
      baz: Mid{
        m1: 2,
        m2: Inner{ x: 42, y: "yo" },
        m3: false
      }
    };
  }
}