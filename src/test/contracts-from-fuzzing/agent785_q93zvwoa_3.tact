struct S1 {
    i1: Int;
}

struct S2 {
    s1: S1;
    str: String;
}

contract OptionalStruct {
    val: S2?;

    init() {
        self.val = null;
    }
}