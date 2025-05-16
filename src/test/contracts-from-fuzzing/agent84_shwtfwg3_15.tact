struct Inner {
    x: Int = 10;
    y: Bool;
}

struct Outer {
    z: Inner = Inner{ y: true };
}

contract TestContract {
    val: Outer = Outer{ z: Inner{ y: true } };

    init() {
        self.val = self.val;
    }
}