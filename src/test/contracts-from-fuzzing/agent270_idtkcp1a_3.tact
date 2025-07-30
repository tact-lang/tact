struct Large {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Bool?;
    f: Int?;
    g: Address;
    h: String;
}

contract ManyFieldsTest {
    data: Large;

    init() {
        self.data = Large{
            a: 1,
            b: true,
            c: myAddress(),
            d: "test",
            e: null,
            f: null,
            g: myAddress(),
            h: "test2"
        };
    }
}