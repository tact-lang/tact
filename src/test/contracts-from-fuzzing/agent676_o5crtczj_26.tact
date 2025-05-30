struct S { a: Int; }

message(0x12345678) M {
    s: S?;
    txt: String;
}

contract TestContract {
    data: M?;

    init() {
        self.data = null;
    }
}