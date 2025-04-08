struct StructWithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
    d: Int?; // optional defaults to null
    e: Bool?; // optional defaults to null
}

contract StructDefaultsFields {
    s: StructWithDefaults;

    init() {
        self.s = StructWithDefaults{
            a: 100,
            b: true,
            c: "xyz",
            d: null,
            e: null
        };
    }
}