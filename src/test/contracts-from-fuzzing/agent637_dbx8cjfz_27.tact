// multiple persistent structs with optional & nested fields
struct A { i: Int?; }
struct B { s: String; a: A?; }
struct C { addr: Address?; b: B; }

contract ComplexNested {
  c: C;

  init() {
    self.c = C{
      addr: null,
      b: B{
        s: "test",
        a: A{
          i: null
        }
      }
    };
  }
}