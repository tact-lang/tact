struct MixFields {
    a: Bool;
    b: Int?;
    c: String;
    d: Bool?;
    e: String?;
    f: Int;
}

contract MixStructTest {
    data: MixFields;

    init() {
        self.data = MixFields{
            a: true,
            b: 42,
            c: "test",
            d: false,
            e: null,
            f: 1,
        };
    }
}