struct Inner {
    a: Int;
    b: Int?;
}

struct Container {
    c: Inner;
    d: Int;
}

contract DeepStruct {
    con: Container;
    
    init() {
        self.con = Container{ c: Inner{ a: 10, b: null }, d: 5 };
    }
}
