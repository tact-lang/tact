struct Inner {
    val: Int;
}

struct Middle {
    inner: Inner;
    opt: Int?;
}

struct Outer {
    middle: Middle;
    m: map<Int, Int>;
}

contract ComplexNested {
    st: Outer;
    
    init() {
        self.st = Outer{
            middle: Middle{
                inner: Inner{ val: 1 },
                opt: null
            },
            m: emptyMap()
        };
    }
}