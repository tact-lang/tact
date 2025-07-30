struct AllNullable {
    one: Int? = null;
    two: Bool? = null;
    three: String? = null;
}

contract TestContract {
    stuff: AllNullable;

    init() {
        self.stuff = AllNullable{ one: null, two: null, three: null };
    }
}