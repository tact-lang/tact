struct Sub {
    a: Int;
    b: Bool?;
    c: String;
}

contract MixedOptionalStruct {
    s: Sub;

    init() {
        self.s = Sub {
            a: 42,
            b: null,
            c: "hello"
        };
    }
}