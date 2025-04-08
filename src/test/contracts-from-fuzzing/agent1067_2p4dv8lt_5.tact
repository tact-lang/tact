struct OptionalDeep {
    s: String?;
    b: Bool?;
    i: Int?;
}

contract OptDeepStore {
    field: OptionalDeep?;

    init() {
        self.field = null;
    }
}