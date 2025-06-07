struct S {
    a: Int;
    b: Int?;
    c: Bool;
    d: String?;
}

contract ComplexInit {
    val: S;
    
    init() {
        self.val = S {
            a: 99,
            b: null,
            c: true,
            d: null
        };
    }
}