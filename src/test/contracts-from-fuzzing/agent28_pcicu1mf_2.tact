struct Nested {
    x: Int;
    y: Int;
}

struct Deep {
    inner: Nested;
    z: Int;
}

contract UseDeep {
    d: Deep;
    init() {
        self.d = Deep{ inner: Nested{ x:1, y:2 }, z:3 };
    }
}