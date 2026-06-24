struct S {
    a: Int;
    b: Bool;
    c: Address;
    d: Int?;
    e: Bool?;
    f: Address?;
}

contract UseDefaults {
    field: S;
    init() {
      self.field = S{
        a: 5,
        b: true,
        c: myAddress(),
        d: null,
        e: null,
        f: null
      };
    }
}