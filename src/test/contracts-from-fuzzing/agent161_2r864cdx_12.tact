struct ZeroOptional {
    count: Int?;
    label: String?;
}

contract NullInitialized {
    data: ZeroOptional;

    init() {
        self.data = ZeroOptional{ count: null, label: null };
    }

    receive() {
        self.data = ZeroOptional{ count: 77, label: "hi" };
    }
}