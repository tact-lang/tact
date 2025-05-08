struct S {
    x: Int?;
}

contract OptionAssign {
    s: S;

    init() {
        self.s = S{x:null};
    }
}