struct Inner { val: Int; }

contract TestContract {
    point: Inner;

    init() {
        self.point = Inner{ val: 1 };
    }
}