struct Triple {
    x: Int;
    y: Int;
    z: Int;
}

contract MultiStructs {
    t1: Triple;
    t2: Triple;

    init() {
        self.t1 = Triple{ x:1, y:2, z:3 };
        self.t2 = Triple{ x:4, y:5, z:6 };
    }
}