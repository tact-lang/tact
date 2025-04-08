struct X1 { a: Int; }
struct X2 { b: Bool; }
struct X3 { c: Int?; }
struct X4 { d: Bool?; }
struct X5 { e: Int; }
struct X6 { f: Bool; }

struct BigNest {
    s1: X1;
    s2: X2;
    s3: X3;
    s4: X4;
    s5: X5;
    s6: X6;
}

contract Weird {
    w: BigNest;

    init() {
        self.w = BigNest{
            s1: X1{ a: 0 },
            s2: X2{ b: false },
            s3: X3{ c: null },
            s4: X4{ d: null },
            s5: X5{ e: -1 },
            s6: X6{ f: true },
        };
    }

    receive() {
        let _ = self.w;
    }
}