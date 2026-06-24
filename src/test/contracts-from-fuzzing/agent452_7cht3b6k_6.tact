struct ManyFields {
  f01: Int; f02: Bool; f03: String; f04: Int?; f05: String?;
  f06: Bool; f07: Int; f08: String; f09: Bool; f10: Int;
}

contract Test7 {
    mf: ManyFields;
    init() {
        self.mf = ManyFields{
          f01: 1, f02: true, f03: "a", f04: null, f05: null,
          f06: false, f07: 77, f08: "b", f09: true, f10: 88
        };
    }
}
