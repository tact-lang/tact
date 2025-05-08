struct Mixed {
    a: Int;
    b: Int?;
    c: String;
    d: String?;
    e: Bool;
    f: Bool?;
}

contract TestContract {
    m: Mixed;
    init() {
        self.m = Mixed{
            a: 1,
            b: 2,
            c: "c",
            d: null,
            e: true,
            f: false
        };
    }
}