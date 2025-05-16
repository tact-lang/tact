struct StructManyFields {
  a: Int;
  b: Bool;
  c: String;
  d: Address;
  e: Int?;
  f: Bool?;
  g: String?;
  h: Address?;
}

contract NestedManyStruct {
    data: StructManyFields;

    init() {
        self.data = StructManyFields{
            a: 1,
            b: false,
            c: "hi",
            d: myAddress(),
            e: null,
            f: true,
            g: null,
            h: null
        };
    }
}
