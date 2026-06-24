struct S {
    a: Int as int64;
    b: Int as uint32;
    c: Int as uint1;
    d: Int as int257;
    e: Bool;
    f: String;
    g: Slice;
}

contract TestContract {
    var: S;

    init() {
        self.var = S{
            a: 12,
            b: 34,
            c: 1,
            d: -5,
            e: true,
            f: "abc",
            g: emptyCell().asSlice()
        };
    }
    
    receive() {
        self.var = S{
            a: -12,
            b: 0,
            c: 0,
            d: 5,
            e: false,
            f: "def",
            g: emptyCell().asSlice()
        };
    }
}