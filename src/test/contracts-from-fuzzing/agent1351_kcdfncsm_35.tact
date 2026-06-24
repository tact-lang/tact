struct Inner1 { a: Int }
struct Inner2 { b: Int }
struct Inner3 { c: Int }
struct Top {
    i1: Inner1;
    i2: Inner2;
    i3: Inner3;
}

contract TripleNest {
    t: Top;

    init() {
        self.t = Top{
            i1: Inner1{ a:1 },
            i2: Inner2{ b:2 },
            i3: Inner3{ c:3 }
        };
    }
}