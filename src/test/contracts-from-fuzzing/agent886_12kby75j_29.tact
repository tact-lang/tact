message(0x12345678) M {
    val: Int;
}

contract TestContract {
    m: M?;

    init() {
        self.m = M{ val: 22 };
    }
}