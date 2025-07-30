// Many optionals interleaved with required fields
struct Mix {
    a: Int?;
    b: Int;
    c: Bool?;
    d: String;
    e: Bool?;
    f: Int;
}

contract MixTest {
    data: Mix;

    init() {
        self.data = Mix{
            a: null,
            b: 1,
            c: true,
            d: "str",
            e: null,
            f: 99
        };
    }
}
