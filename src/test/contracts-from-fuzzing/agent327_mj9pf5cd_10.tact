struct Sub {
    z: Int?;
}

struct Top {
    x: Int;
    y: Sub;
}

contract NestedOpt {
    val: Top;

    init() {
        self.val = Top{ x: 1, y: Sub{ z: null } };
    }
}
