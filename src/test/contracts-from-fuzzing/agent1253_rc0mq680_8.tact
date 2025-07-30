struct IntFirst {
    num: Int;
    flag: Bool;
}

contract Test {
    val: IntFirst;

    init() {
        self.val = IntFirst{ num: 42, flag: true };
    }
}
