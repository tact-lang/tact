struct NestedOptionals {
    a: Int?;
    b: String?;
}

contract OptionalInStorage {
    s: NestedOptionals?;

    init() {
        self.s = null;
    }
}