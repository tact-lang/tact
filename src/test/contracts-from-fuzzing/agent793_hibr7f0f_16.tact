struct Simple {
    count: Int;
    enabled: Bool;
}

contract OptionalStructInside {
    s: Simple?;
    init() {
        self.s = null;
    }
}