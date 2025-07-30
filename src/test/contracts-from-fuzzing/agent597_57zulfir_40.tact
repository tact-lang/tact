struct S1 {
    a: Int;
}

struct S2 {
    optS1: S1?;
}

contract Compat {
    val: S2;
    init() {
        self.val = S2{
            optS1: null
        };
    }
}