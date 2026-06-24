struct S1 {
    x: Int = 1;
}

struct S2 {
    s1: S1;
}

contract OptionalNestedLevel {
    opt: S2? = null;

    init() {
        self.opt = null;
    }
    receive(){}
}