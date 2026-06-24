struct Base1 { a: Int; }
struct Base2 { b: Int; }
struct Big {
  one: Base1;
  two: Base2;
  flag: Bool;
}
contract StructMix {
  st: Big;
  init() {
    self.st = Big{
      one: Base1{ a:1 },
      two: Base2{ b:2 },
      flag: true
    };
  }
}