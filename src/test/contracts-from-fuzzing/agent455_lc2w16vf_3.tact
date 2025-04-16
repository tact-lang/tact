struct Mixed {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract MixedTypes {
    val: Mixed;

    init() {
        self.val = Mixed{
            a: 10,
            b: null,
            c: true,
            d: null,
            e: "hello",
            f: "world",
        };
    }
}