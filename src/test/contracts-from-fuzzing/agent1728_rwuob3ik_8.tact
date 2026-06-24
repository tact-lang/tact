struct MultiOption {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
}

contract TestContract {
    val: MultiOption;

    init() {
        self.val = MultiOption{};
    }
}