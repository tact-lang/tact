struct Optionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract TestContract {
    details: Optionals;

    init() {
        self.details = Optionals{ a: null, b: null, c: null, d: null };
    }
}