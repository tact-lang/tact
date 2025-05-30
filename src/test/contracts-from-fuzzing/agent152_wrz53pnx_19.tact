struct RecA {
    x: Int;
}

struct RecB {
    y: Bool;
    z: RecA;
}

contract RecNestVars {
    data: RecB;

    init() {
        self.data = RecB{ y:true, z:RecA{ x:42 } };
    }
}