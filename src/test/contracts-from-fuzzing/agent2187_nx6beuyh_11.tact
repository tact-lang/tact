struct OptsDefaults {
    a: Int?;
    b: Bool = true;
    c: String?;
    d: Address;
    e: Cell? = null;
}

contract MixDefaults {
    data: OptsDefaults;

    init() {
        self.data = OptsDefaults{
            a: null,
            c: null,
            d: myAddress()
        };
    }
}