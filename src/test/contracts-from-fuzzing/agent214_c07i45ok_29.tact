struct OptsOnly {
    x: Int?; y: Bool?; z: String?;
}

contract TestContract {
    opts: OptsOnly;

    init() {
        self.opts = OptsOnly{};
    }
}