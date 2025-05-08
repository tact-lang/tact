struct Nested {
    a: Int;
    b: Bool;
}

struct Containing {
    x: Int;
    y: Nested;
}

contract Test14 {
    opt: Containing?;

    init() {
        self.opt = null;
    }
}
