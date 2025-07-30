struct LongNested1 {
  a: Int;
  b: Bool;
}

struct LongNested2 {
  c: LongNested1;
  d: String;
}

struct LongNested3 {
  e: LongNested2;
  f: Address;
}

struct LongNested4 {
  g: LongNested3;
  h: Slice;
}

struct LongNested5 {
  i: LongNested4;
  j: Cell;
}

contract DeepChain {
  value: LongNested5;
  init() {
    self.value = LongNested5{
      i: LongNested4{
        g: LongNested3{
          e: LongNested2{
            c: LongNested1{
              a: 1,
              b: true
            },
            d: "deep"
          },
          f: myAddress()
        },
        h: emptyCell().asSlice()
      },
      j: emptyCell()
    };
  }
}