struct Wide {
    a: Int;
    b: Bool;
    c: String;
    d: Bool;
    e: Int;
    f: String;
}

contract TestContract {
    payload: Wide;

    init() {
        self.payload = Wide{
            a: 1,
            b: false,
            c: "foo",
            d: true,
            e: 42,
            f: "bar"
        };
    }
}