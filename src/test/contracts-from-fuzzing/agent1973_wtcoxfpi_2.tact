struct Inner {
    x: Int;
    y: Bool;
    z: String;
    opt: Int?;
}

contract TestContract {
    s: Inner;

    init() {
        self.s = Inner{ x: 1, y: false, z: "hi", opt: null };
    }
}
