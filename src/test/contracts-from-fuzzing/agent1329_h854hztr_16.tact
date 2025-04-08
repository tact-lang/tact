struct D {
    x: Int as int1; // 1 bit signed integer
    y: Int as int257; // full int
}

contract MinMaxIntV {
    val: D;

    init() {
        self.val = D{ x:0, y:0 };
    }
}
