struct Outer {
    inner: Inner;
}

struct Inner {
    number: Int;
    label: String;
    flag: Bool;
}

contract NestedMixed {
    data: Outer;

    init() {
        self.data = Outer{ inner: Inner{ number:1, label:"x", flag:true } };
    }
}