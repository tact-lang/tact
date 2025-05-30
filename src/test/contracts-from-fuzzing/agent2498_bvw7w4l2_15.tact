struct SOne { a: Int }
struct STwo { b: Int }
struct SThree {
    s1: SOne;
    s2: STwo;
    c: Int;
}

contract TestContract {
    val: SThree;
    init() {
        self.val = SThree{
            s1: SOne{ a: 1 },
            s2: STwo{ b: 2 },
            c: 3,
        };
    }
}