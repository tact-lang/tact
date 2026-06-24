struct Data {
    a: Int;
    b: Int?;
    c: Bool;
    d: String;
    e: Bool?;
    f: String?;
}

contract MixedNested {
    content: Data;

    init() {
        self.content = Data{
            a: 10,
            b: 11,
            c: false,
            d: "hi",
            e: null,
            f: "optional",
        };
    }
}