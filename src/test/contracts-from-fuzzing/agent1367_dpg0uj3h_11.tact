struct MassiveNested {
  a: Int;
  b: Inner1;
  c: Inner2;
}

struct Inner1 {
  d: Int?;
  e: Inner3;
}

struct Inner2 {
  f: Bool;
  g: String;
}

struct Inner3 {
  h: Address?;
  i: Inner4;
}

struct Inner4 {
  j: Int?;
  k: Bool?;
}

contract MassiveTestContract {
  val: MassiveNested;

  init() {
    self.val = MassiveNested{
      a: 99,
      b: Inner1{
        d: null,
        e: Inner3{
          h: null,
          i: Inner4{
            j: null,
            k: null,
          },
        },
      },
      c: Inner2{
        f: true,
        g: "test",
      },
    };
  }
}