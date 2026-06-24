struct OptionalNested {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract OptionalStorage {
    s: OptionalNested;

    init() {
        self.s = OptionalNested{
            x: null,
            y: true,
            s: null
        };
    }
}