struct Inner { x: Int; y: Int; }

contract TestContract {
    p: Inner;

    init() {
        self.p = Inner { x: 1, y: 2 };
    }
}