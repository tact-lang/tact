struct OptNested {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalStructField {
    data: OptNested;

    init() {
        self.data = OptNested{ x: null, y: null, z: null };
    }
}