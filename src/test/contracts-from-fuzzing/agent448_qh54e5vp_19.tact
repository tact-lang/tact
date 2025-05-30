struct S {
    i: Int = 5;
    b: Bool = false;
}

contract DefaultStructUse {
    s: S;
    
    init() {
        self.s = S{};
    }
}