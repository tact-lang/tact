struct Mid {
    x: Int;
    y: Bool;
    z: String?;
}

contract OptionalNested {
    optMid: Mid?;

    init() {
        self.optMid = Mid{
            x: 12,
            y: true,
            z: null
        };
    }
}