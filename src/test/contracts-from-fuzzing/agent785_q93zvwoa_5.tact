struct A {
  a: Int;
  b: Bool;
}

struct B {
  c: String;
  d: A;
}

struct C {
  e: B;
  f: Int;
}

contract CrazyFields {
  ff1: Int;
  ff2: String;
  ff3: Bool;
  ff4: C;

  init() {
    self.ff1 = 12;
    self.ff2 = "test";
    self.ff3 = true;
    self.ff4 = C{
      e: B{
        c: "deep",
        d: A{
          a: 1,
          b: false,
        },
      },
      f: 100,
    };
  }
}