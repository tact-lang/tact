struct Inner { flag: Bool; value: Int?; }

contract TestContract {
    nested: Inner = Inner{ flag: true, value: 123 };

    init() {
        self.nested = Inner{ flag: false, value: null };
    }
}