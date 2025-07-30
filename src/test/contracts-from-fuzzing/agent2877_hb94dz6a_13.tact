struct Dummy { f: Int; }

contract OptionalField {
    x: Dummy?;

    init() {
        self.x = null;
    }
}