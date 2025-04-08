struct Wrap {
    val: Int;
}

struct DoubleWrap {
    inner: Wrap;
    flag: Bool;
}

contract NestedStructFields {
    a: Wrap;
    b: DoubleWrap;

    init() {
        self.a = Wrap{ val:1 };
        self.b = DoubleWrap{ inner: Wrap{ val:2 }, flag:true };
    }
}