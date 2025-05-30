struct A {
  x: Int;
  y: Bool;
}

struct B {
  innerA: A;
  z: String;
}

struct C {
  innerB: B;
  flag: Bool?;
}

contract DeepStorage {
  content: C;

  init() {
    self.content = C{
      innerB: B{
        innerA: A{
          x: 101,
          y: true,
        },
        z: "hello",
      },
      flag: false,
    };
  }
}