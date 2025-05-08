struct BigNullable {
    s: String?;
    i: Int?;
    b: Bool?;
}

contract BigOptional {
    x: BigNullable?;

    init() {
        self.x = null;
    }
}