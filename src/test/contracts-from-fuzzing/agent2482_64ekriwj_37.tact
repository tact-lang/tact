struct RefStruct {
    s: S;
}

struct S {
    x: Int;
}

contract Test {
    val: RefStruct;

    init() {
        self.val = RefStruct{ s: S{ x:1 } };
    }
}