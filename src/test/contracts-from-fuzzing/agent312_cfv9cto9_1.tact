struct Inner { val: Int; }

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{ val: 1 };
    }
}