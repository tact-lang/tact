struct Mixed {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract MixedTypes {
    val: Mixed;
    init() {
        self.val = Mixed{
            a: 1,
            b: "b",
            c: true,
            d: null,
            e: null,
            f: null
        };
    }
}