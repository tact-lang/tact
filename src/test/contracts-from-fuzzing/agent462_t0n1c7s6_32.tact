struct OneOptional {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
}

contract MixedFieldsTest {
    payload: OneOptional;

    init() {
        self.payload = OneOptional{
            a: 10,
            b: true,
            c: "str",
            d: myAddress(),
            e: null,
            f: null,
            g: null,
            h: null
        };
    }
}