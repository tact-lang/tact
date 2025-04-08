struct Optionals {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract OptionalStorage {
    val: Optionals;

    init() {
        self.val = Optionals{a: null, b: true, c: null};
    }
}