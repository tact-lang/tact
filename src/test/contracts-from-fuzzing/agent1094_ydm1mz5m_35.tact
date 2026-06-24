struct S {
    x: Int;
    y: String;
}

contract StructArraySim {
    s1: S;
    s2: S;
    init() {
        self.s1 = S{x:1,y:"a"};
        self.s2 = S{x:2,y:"b"};
    }
}