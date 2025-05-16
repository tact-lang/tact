struct Mid1 {
    a: Int;
    b: Int;
}

struct Mid2 {
    x: Bool;
    y: Bool;
}

struct Top {
    m1: Mid1;
    m2: Mid2;
}

contract MultiNested {
    data: Top;

    init() {
        self.data = Top{
            m1: Mid1{ a:1, b:2 },
            m2: Mid2{ x:true, y:false }
        };
    }
}