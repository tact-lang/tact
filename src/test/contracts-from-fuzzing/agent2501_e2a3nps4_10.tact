struct Leaf {
    v: Int;
}

struct Mid {
    a: Leaf?;
    b: Leaf?;
}

struct Top {
    m1: Mid;
    m2: Mid;
}

contract MultiLayerNestedOptionals {
    payload: Top;

    init() {
        self.payload = Top{
            m1: Mid{ a:null, b:null },
            m2: Mid{ a:null, b:null }
        };
    }
}