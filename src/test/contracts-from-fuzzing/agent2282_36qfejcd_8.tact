struct SOptional {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract Test7 {
    s: SOptional;

    init() {
        self.s = SOptional{ x: null, y: null, s: null };
    }
}