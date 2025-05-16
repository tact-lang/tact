struct BoolIntStringOptional {
    b: Bool;
    i: Int;
    s: String?;
}

contract MixedTypes {
    value: BoolIntStringOptional;

    init() {
        self.value = BoolIntStringOptional{
            b: false,
            i: 123,
            s: "abc",
        };
    }
}