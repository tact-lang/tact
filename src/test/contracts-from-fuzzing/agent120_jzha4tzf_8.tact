struct DeepOption {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract MultiOptionContract {
    record: DeepOption?;

    init() {
        self.record = null;
    }

    receive() {
        self.record = DeepOption{
            x: 12,
            y: true,
            z: "hi"
        };
    }
}