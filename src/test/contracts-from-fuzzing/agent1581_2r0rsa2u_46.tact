struct A { s: String; }
struct B { a: A; }

contract NestedStrStruct {
  st: B;

  init() {
    self.st = B{
      a: A{
        s: "inner",
      },
    };
  }
}