struct S {
    a: Int;
    b: Int?;
    c: Int;
    d: Int?;
    e: Int;
    f: Int?;
    g: Int;
}

contract Test {
    data: S;
    
    init() {
        self.data = S{
            a: 1,
            b: null,
            c: 2,
            d: null,
            e: 3,
            f: null,
            g: 4
        };
    }
}