struct Boo {
    x: Int;
}

contract OptionalStructField {
    maybeBoo: Boo?;

    init() {
        self.maybeBoo = null;
    }
}