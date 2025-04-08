struct A {
    val: Int;
}

contract Defaults {
    p: A;

    init() {
        self.p = A{val:0};
    }
}
