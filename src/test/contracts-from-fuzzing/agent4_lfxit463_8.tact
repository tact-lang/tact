struct OptionalLayer {
    one: Int?;
    two: Bool?;
    three: String?;
}

contract DefaultInit {
    param: OptionalLayer;

    init() {
        self.param = OptionalLayer{};
    }
}