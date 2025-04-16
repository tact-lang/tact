struct C1 { a: Int; }
struct C2 { b: Int; }
struct C3 { c: Int; }
struct Complex {
  f1: C1;
  f2: C2;
  f3: C3;
  s: String;
}

contract TestStorage {
  c: Complex;

  init() {
    self.c = Complex{
      f1: C1{ a: 1 },
      f2: C2{ b: 2 },
      f3: C3{ c: 3 },
      s: "hi"
    };
  }
}