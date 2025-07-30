// deeply nested struct chains with varied types

struct S4 {
  b: Bool;
  str: String;
}

struct S3 {
  inner: S4;
  x: Int;
}

struct S2 {
  inner: S3;
  addr: Address;
}

struct S1 {
  inner: S2;
  cell: Cell;
}

contract DeepMixed {
  data: S1;

  init() {
    self.data = S1{
      inner: S2{
        inner: S3{
          inner: S4{
            b: true,
            str: "deep"
          },
          x: 10
        },
        addr: myAddress()
      },
      cell: emptyCell()
    };
  }
}