message(10) M {
    a: Int;
}

struct Holder {
    m: M;
    val: Int;
}

contract NestedMessageStruct {
    val: Holder;
    init() {
        self.val = Holder{ m: M{ a: 42 }, val: 1 };
    }
}