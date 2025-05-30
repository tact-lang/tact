struct Mixed {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestContract {
    complex: Mixed;

    init() {
        self.complex = Mixed{
            a: 123,
            b: true,
            c: "hi",
            d: null,
            e: null,
            f: null
        };
    }
}