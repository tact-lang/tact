struct D {
    x: Int;
    y: Bool;
}

struct C {
    d: D;
    s: String;
}

contract OptionalWrapper {
    c: C?;

    init() {
        self.c = null;
    }
}