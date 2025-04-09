// Testing optional struct type with default NULL assignment
struct Small {
    x: Int;
}

contract OptionalStructField {
    s: Small?;

    init() {
        self.s = null;
    }
}