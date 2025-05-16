struct S {
    a: Int;
    b: Int?;
}

contract OptInsideStruct {
    x: S;
    init() {
        self.x = S{a: 1, b: null};
    }
}
