struct Optioned {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract OptionalStructFields {
    optData: Optioned?;

    init() {
        self.optData = null;
    }
}