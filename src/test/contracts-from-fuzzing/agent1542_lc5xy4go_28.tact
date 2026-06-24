struct SInner { a: Int }

contract AssignOrder {
    s1: SInner;
    s2: SInner;

    init() {
        self.s2 = SInner{a:2};
        self.s1 = SInner{a:1};
    }
}