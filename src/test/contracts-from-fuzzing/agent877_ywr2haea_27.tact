struct MixType {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract MixTypeField {
    storage: MixType?;

    init() {
        self.storage = MixType{
            a: 99,
            b: false,
            c: "mix",
            d: null,
            e: null,
            f: null,
        };
    }
}