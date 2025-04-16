struct Mixed {
    a: Int;
    b: String;
    c: Bool?;
    d: Int?;
    e: String?;
    f: Bool;
}

contract TestContract {
    data: Mixed? = null;

    init() {
        self.data = Mixed{
            a: 123,
            b: "abc",
            c: false,
            d: 456,
            e: "def",
            f: true
        };
    }
}
