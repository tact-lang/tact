contract NestedStructsFields {
    s1: Int;
    s2: Bool;

    init() {
        self.s1 = 111;
        self.s2 = false;
    }
}

contract Another(
    p1: Int,
    p2: Bool,
) {}
