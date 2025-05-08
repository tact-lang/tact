struct Inner { val1: Int; val2: Bool; }

contract TestContract {
    point: Inner;

    init() {
        self.point = Inner{ val1: 1, val2: true };
    }
}