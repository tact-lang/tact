struct ManyOpts {
    x1: Int?;
    x2: Int?;
    x3: Bool?;
    x4: Bool?;
    x5: String?;
    x6: String?;
    x7: Address?;
    x8: Address?;
}

contract TestContract {
    vals: ManyOpts;
    init() {
        self.vals = ManyOpts{};
    }
    receive() {}
}