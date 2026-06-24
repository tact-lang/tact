struct Crazy {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int;
    e: Bool;
    f: String;
}

contract DoubleStorage {
    first: Crazy;
    second: Crazy;

    init() {
        self.first = Crazy{
            a: null, b: null, c: null,
            d: 1, e: true, f: "foo"
        };
        self.second = Crazy{
            a: 2, b: false, c: "bar",
            d: 3, e: false, f: "baz"
        };
    }
}