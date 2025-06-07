struct DeepOptional {
    x: Int?;
    y: Bool?;
    z: Address?;
}

contract TestContract {
    deep: DeepOptional = DeepOptional{};

    init() {
        self.deep = DeepOptional{
            x: 123,
            y: true,
            z: null,
        };
    }
}