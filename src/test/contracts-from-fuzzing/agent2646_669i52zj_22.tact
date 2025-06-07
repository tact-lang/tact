struct MixedStuff {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
}

contract MixedFields {
    x: MixedStuff;
    init() {
        self.x = MixedStuff{
            a: 1,
            b: null,
            c: "c",
            d: 4,
            e: true,
            f: null
        };
    }
    receive() {}
}