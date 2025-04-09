struct Inner {
    a: Int;
    b: Bool;
    c: String?;
}

contract TestContract {
    x: Int = 1;
    y: Bool = false;
    z: Inner;

    init() {
        self.z = Inner{ a: 10, b: true, c: null };
    }
}