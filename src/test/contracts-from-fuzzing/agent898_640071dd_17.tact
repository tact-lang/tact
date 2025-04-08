struct Level1 {
    a: Int;
    b: Bool;
}

contract NestedInOptional {
    f: Level1?;

    init() {
        self.f = null;
    }
}
