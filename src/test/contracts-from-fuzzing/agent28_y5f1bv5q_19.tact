struct Mixed {
    a: Int;
    b: Bool?;
    c: String;
    d: String?;
    e: Int;
    f: Bool?;
}

contract Test {
    data: Mixed;

    init() {
        self.data = Mixed{
            a: 10,
            b: null,
            c: "test",
            d: null,
            e: 20,
            f: true
        };
    }
}