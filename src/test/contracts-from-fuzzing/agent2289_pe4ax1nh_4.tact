struct A { x: Int; y: Bool }
struct B { a: A; name: String }
struct C { b: B; opt: Int? }

contract ManyNested {
  data: C;

  init() {
    self.data = C{
      b: B{
        a: A{
          x: 1,
          y: false
        },
        name: "hello"
      },
      opt: null
    };
  }
}
