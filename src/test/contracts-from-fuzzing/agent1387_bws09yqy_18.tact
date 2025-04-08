struct OuterMost { 
    a: Int; 
    b: Int?; 
    c: InnerMid; 
}

struct InnerMid {
    x: Int?;
    y: Bool;
}

contract MultipleNestOpt {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            a: 5,
            b: null,
            c: InnerMid{ x: 10, y: false },
        };
    }
}