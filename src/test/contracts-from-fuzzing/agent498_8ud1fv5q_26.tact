struct S {
    a: Int;
}

contract ChainAssignment {
    val: S;
    init() {
        self.val = S{a:1};
        self.val = S{a:2};
    }
}