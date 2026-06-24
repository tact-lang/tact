struct MixedOptional {
    a: Int?;
    b: Bool;
    c: String?;
    d: Bool?;
    e: String;
}

contract MixedOptionalTest {
    data: MixedOptional;

    init() {
        self.data = MixedOptional{
            a: null,
            b: true,
            c: null,
            d: null,
            e: "non-null",
        };
    }

    receive() {
        let _ = self.data;
    }
}
