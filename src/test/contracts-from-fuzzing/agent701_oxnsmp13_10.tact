struct Tiny {
    x: Int;
}

contract OptionalWithDefault {
    data: Tiny? = null;

    init() {
        self.data = null;
    }
}