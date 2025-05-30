struct OptStringInt {
    name: String?;
    age: Int?;
}

contract OptStructCombo {
    data: OptStringInt;

    init() {
        self.data = OptStringInt{
            name: null,
            age: null
        };
    }
}