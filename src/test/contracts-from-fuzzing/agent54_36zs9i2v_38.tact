struct NestedAB {
    a: Int;
    b: Int;
}

contract ManyNestedFields {
    x: NestedAB;
    y: NestedAB;
    z: NestedAB;

    init() {
        self.x = NestedAB{ a:1, b:2 };
        self.y = NestedAB{ a:3, b:4 };
        self.z = NestedAB{ a:5, b:6 };
    }
}