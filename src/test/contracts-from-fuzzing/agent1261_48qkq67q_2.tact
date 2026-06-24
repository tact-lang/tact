struct Nested {
  a: Int;
  b: Bool;
  c: String?;
}

struct Mid {
  m: Int;
  n: Nested;
}

contract LayeredFields {
  field: Mid;

  init() {
    self.field = Mid{
      m: 1,
      n: Nested{ a: 2, b: true, c: null },
    };
  }
}