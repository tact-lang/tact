struct Tiny {
    a: Int;
}

contract OptField {
    t: Tiny?;

    init() {
        self.t = null;
    }
}