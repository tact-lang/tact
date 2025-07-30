struct Data {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
}

contract Test {
    d: Data;

    init() {
        self.d = Data{
            a: 1,
            b: true,
            c: null,
            d: null,
            e: "abc",
            f: null
        };
    }
}
