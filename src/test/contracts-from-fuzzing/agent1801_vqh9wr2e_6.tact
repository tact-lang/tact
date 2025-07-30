struct Nested1 { a: Int; b: Int; }
struct Nested2 { c: Nested1; d: Int; }
struct Nested3 { e: Nested2; f: Int; }

contract MultiLayer {
  deepField: Nested3;

  init() {
    self.deepField = Nested3{
      e: Nested2{
        c: Nested1{
          a: 10,
          b: 20,
        },
        d: 30,
      },
      f: 40,
    };
  }
}