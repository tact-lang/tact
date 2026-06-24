struct Inner1 { a: Int; }
struct Inner2 { b: Int; }
struct Inner3 { c: Int; }

struct Mid1 { x: Inner1; }
struct Mid2 { y: Inner2; }
struct Mid3 { z: Inner3; }

struct Top {
    m1: Mid1;
    m2: Mid2;
    m3: Mid3;
}

contract TestContract {
    combined: Top;

    init() {
        self.combined = Top{
            m1: Mid1{ x: Inner1{ a: 1 } },
            m2: Mid2{ y: Inner2{ b: 2 } },
            m3: Mid3{ z: Inner3{ c:3 } }
        };
    }
}