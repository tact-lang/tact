struct SerialNested1 {
  a: Int; b: Bool;
}

struct SerialNested2 {
  inner: SerialNested1;
  c: String?; d: Address;
}

struct SerialNested3 {
  deeper: SerialNested2;
  e: Bool?; f: Int?;
}

contract SerialNestedLevels {
  store: SerialNested3;

  init() {
    self.store = SerialNested3{
      deeper: SerialNested2{
        inner: SerialNested1{
          a:1, b:true
        },
        c:null,
        d:myAddress(),
      },
      e: null,
      f: null,
    };
  }
}
