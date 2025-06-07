struct Inner {
    x: Int as uint8;
    y: Bool?;
}

contract TestContract {
    s: Inner?;

    init() {
        self.s = null;
    }
}