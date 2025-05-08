struct OptStringInt {
    name: String?;
    score: Int?;
}

contract OptionalStructField {
    data: OptStringInt;

    init() {
        self.data = OptStringInt{
            name: null,
            score: null
        };
    }
}
