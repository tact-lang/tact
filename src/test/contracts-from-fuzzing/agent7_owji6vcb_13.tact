struct OptionalMany {
    x: Int?;
    y: Bool?;
    s: String?;
    f: Bool?;
    g: String?;
}

contract Test {
    data: OptionalMany;
    init() {
        self.data = OptionalMany{
            x: null,
            y: null,
            s: null,
            f: null,
            g: null
        };
    }
}