struct Flattened {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
    f: Bool;
    g: Int;
    h: String;
}

contract ManyMixedTypes {
    value: Flattened;

    init() {
        self.value = Flattened{
            a: 1,
            b: false,
            c: "hi",
            d: null,
            e: "not null",
            f: true,
            g: -99,
            h: "hello",
        };
    }

    receive() {
        let v = self.value;
    }
}