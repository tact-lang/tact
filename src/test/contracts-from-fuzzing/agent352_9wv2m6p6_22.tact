struct S {
    x: Int;
    y: Slice as remaining;
}

contract T {
    s1: S;
    s2: S;

    init() {
        self.s1 = S{x:1,y:emptyCell().asSlice()};
        self.s2 = S{x:2,y:emptyCell().asSlice()};
    }
}