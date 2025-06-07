struct OuterMost {
    x: Int;
    y: Int;
    z: Int;
}

contract MultiStructVars {
    pos1: OuterMost;
    pos2: OuterMost;

    init() {
        self.pos1 = OuterMost{ x:1, y:2, z:3 };
        self.pos2 = OuterMost{ x:4, y:5, z:6 };
    }
}