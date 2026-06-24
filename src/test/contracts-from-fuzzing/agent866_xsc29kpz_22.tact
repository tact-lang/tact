struct Mid {
    a: Int;
    b: Bool?;
}

struct Outer {
    m1: Mid;
    m2: Mid;
}

contract WithMid {
    data: Outer;
    init() {
        self.data = Outer{
            m1: Mid { a:1, b:null },
            m2: Mid { a:2, b:true }
        };
    }
}