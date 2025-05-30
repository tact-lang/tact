message(123) MsgX {
    val: Int;
}

struct StructY {
    flag: Bool;
}

contract OptCompositeFields {
    m: MsgX? = null;
    s: StructY? = null;
    n: Int = 0;

    init() {
        self.n = 42;
    }
}