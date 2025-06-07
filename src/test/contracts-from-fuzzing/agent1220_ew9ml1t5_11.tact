struct SOpt {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalStructField {
    data: SOpt;

    init() {
        self.data = SOpt{
            x: null,
            y: true,
            z: "hi"
        };
    }
}