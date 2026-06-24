struct DeepOptional {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract TopOptional {
    data: DeepOptional?;

    init() {
        self.data = null;
    }
}