struct Param {
    field: Int = 42;
}

contract Test {
    data: Param;

    init() {
        self.data = Param{};
    }
}