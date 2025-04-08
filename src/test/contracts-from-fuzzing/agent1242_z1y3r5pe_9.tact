struct Variant {
    flag: Bool;
    valInt: Int?;
    valStr: String?;
}

contract Test {
    v: Variant;

    init() {
        self.v = Variant{
            flag: true,
            valInt: 42,
            valStr: null,
        };
    }
}
