struct ZeroSize {
    n: Int = 0;
}

contract DefValZero {
    field: ZeroSize;
    init() {
        self.field = ZeroSize{};
    }
}