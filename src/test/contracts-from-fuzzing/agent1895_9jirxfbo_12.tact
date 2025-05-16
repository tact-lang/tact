struct StringsAndBools {
    a: String;
    b: Bool;
    c: String?;
    d: Bool?;
}

contract DiverseFields {
    val: StringsAndBools;

    init() {
        self.val = StringsAndBools{
            a: "abc",
            b: true,
            c: null,
            d: false
        };
    }
}