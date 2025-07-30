struct S {
    a: Int;
    b: Int?;
    c: Int;
    d: Int?;
    e: Int;
    f: Int?;
}

contract TestContract {
    sfield: S;

    init() {
        self.sfield = S{
            a: 1,
            b: null,
            c: 3,
            d: 4,
            e: 5,
            f: null
        };
    }
}