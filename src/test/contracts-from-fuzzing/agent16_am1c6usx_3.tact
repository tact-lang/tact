struct Nested1 {
  a: Int;
}

struct Nested2 {
  inner: Nested1;
}

struct Nested3 {
  wrap: Nested2;
}

contract TripleNest {
    data: Nested3;

    init() {
        self.data = Nested3{ wrap: Nested2{ inner: Nested1{ a: 42 } } };
    }
}
