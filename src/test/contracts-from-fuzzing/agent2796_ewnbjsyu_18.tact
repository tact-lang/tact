struct Sub {
    i: Int;
    b: Bool;
}

contract NestedDirectFields {
    s1: Sub;
    s2: Sub;

    init() {
        self.s1 = Sub{ i: 5, b: true };
        self.s2 = Sub{ i: 42, b: false };
    }
}