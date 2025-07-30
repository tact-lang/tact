struct A { a: Int }
struct B { b: Int }
struct C { c: Int }

struct BigNest {
    aa: A;
    bb: B;
    cc: C;
}

contract TestBn {
    val: BigNest;

    init() {
        self.val = BigNest{
            aa: A{ a:1 },
            bb: B{ b:2 },
            cc: C{ c:3 },
        };
    }
}