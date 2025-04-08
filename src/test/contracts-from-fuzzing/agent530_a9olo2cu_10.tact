struct MixType {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract Mixed {
    val: MixType;

    init() {
        self.val = MixType{
            a: 1,
            b: true,
            c: "abc",
            d: null,
            e: false,
            f: null
        };
    }
}
