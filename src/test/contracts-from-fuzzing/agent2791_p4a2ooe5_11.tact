struct S {
    a: Int;
    b: Int?;
    c: String;
    d: Bool?;
    e: String;
}

contract TestContract {
    sfield: S;

    init() {
        self.sfield = S{
            a: 1,
            b: null,
            c: "sample",
            d: true,
            e: "end",
        };
    }
}
