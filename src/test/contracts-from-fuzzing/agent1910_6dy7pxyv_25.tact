struct Sub1 { a: Int; }
struct Sub2 { b: Int; }
struct Sub3 { c: Int; }
struct Sub4 { d: Int; }

struct Mid1 { x: Sub1; y: Sub2; }
struct Mid2 { x: Sub3; y: Sub4; }

struct Top {
    m1: Mid1;
    m2: Mid2;
}

contract MultiNest {
    data: Top;

    init() {
        self.data = Top{
            m1: Mid1{ x: Sub1{a:1}, y: Sub2{b:2} },
            m2: Mid2{ x: Sub3{c:3}, y: Sub4{d:4} }
        };
    }
}
