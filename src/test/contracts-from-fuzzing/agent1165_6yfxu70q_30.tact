struct SPrime {
    val: Int;
}

contract DefaultInitStructVar {
    s: SPrime;

    init() {
        self.s = SPrime{ val: 0 };
    }
}
