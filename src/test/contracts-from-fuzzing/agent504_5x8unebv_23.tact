struct SDefault {
    k: Int = 42;
    b: Bool = true;
}

contract DefaultStructVals {
    data: SDefault;

    init() {
        self.data = SDefault{};
    }

    receive() {
        let g = self.data;
    }
}