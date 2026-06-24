struct A { a: Int }

contract NestedManyOptionals {
  a: A?;
  b: Int?;
  c: Bool?;
  d: String?;
  init() {
    self.a = A{ a: 4 };
    self.b = 10;
    self.c = true;
    self.d = "test";
  }
}