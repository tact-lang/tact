struct S {
    a: Int;
    b: Int?;
    c: Int?;
    d: Int;
}

contract Test {
    val: S;
    
    init() {
        self.val = S{a: 1, b: null, c: null, d: 2};
    }
}