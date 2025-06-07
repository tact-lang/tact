// test for large nested contract fields with mixed types
struct Inner {
    i: Int;
    f: Bool;
    s: String;
    addr: Address;
    c: Cell;
}

struct Container {
    nested: Inner;
    optStr: String?;
    optInt: Int?;
}

contract HugeMixed {
    c1: Container;
    c2: Container;

    init() {
        let inner = Inner{
            i:9,f:true,s:"x",addr:myAddress(),c:emptyCell()
        };
        self.c1 = Container{ nested: inner, optStr:null, optInt:null };
        self.c2 = Container{ nested: inner, optStr:"str", optInt:7 };
    }
}
