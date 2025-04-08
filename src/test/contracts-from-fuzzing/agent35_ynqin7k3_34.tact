struct X {
    a: Int;
}
struct Y {
    b: Int;
}

contract MultiStructFields {
    s1: X;
    s2: Y;

    init() {
        self.s1 = X{a:1};
        self.s2 = Y{b:2};
    }
}