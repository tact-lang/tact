contract OptionalStructsNull {
    val1: Simple?;
    val2: Simple?;

    init() {
        self.val1 = null;
        self.val2 = null;
    }
}

struct Simple {
    a: Int;
    b: Bool;
}