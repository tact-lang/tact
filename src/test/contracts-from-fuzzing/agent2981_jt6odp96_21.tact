struct A {
    a1: Int;
    a2: Int;
}

struct B {
    b1: Int;
    b2: Int;
}

struct Both {
    sa: A;
    sb: B;
}

contract TwoStructs {
    val: Both;

    init() {
        self.val = Both{
            sa: A{a1:1,a2:2},
            sb: B{b1:3,b2:4},
        };
    }
}