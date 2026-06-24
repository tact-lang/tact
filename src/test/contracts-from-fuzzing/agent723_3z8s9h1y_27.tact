struct X {
    val: Int;
    opt: Bool?;
}

contract TestContract {
    x: X;
    y: X;
    z: X;

    init() {
        self.x = X{ val: 1, opt: true };
        self.y = X{ val: 2, opt: null };
        self.z = X{ val: 3, opt: false };
    }
}