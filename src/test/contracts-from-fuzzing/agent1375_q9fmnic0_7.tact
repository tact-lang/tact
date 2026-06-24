struct Optionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}

contract OptionalStorage {
    values: Optionals;

    init() {
        self.values = Optionals{ a: null, b: null, c: null, d: null, e: null };
    }
}