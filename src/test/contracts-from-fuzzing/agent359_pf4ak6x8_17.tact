struct TripleNest {
    i: Int;
    s1: Inner1;
}

struct Inner1 {
    j: Int;
    s2: Inner2;
}

struct Inner2 {
    k: Int;
}

contract TripleNestTest {
    val: TripleNest;
    init() {
        self.val = TripleNest{
            i: 1,
            s1: Inner1{
                j: 2,
                s2: Inner2{
                    k: 3
                }
            }
        };
    }
}