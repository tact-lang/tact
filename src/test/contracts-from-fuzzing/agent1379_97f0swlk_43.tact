struct A { v: Int }

contract OptionalField {
    test: A? = null;

    init() {
        self.test = null;
    }
}
