struct S {
    a: Int;
    b: Address?;    
}

contract TestNestedOptional {
    s: S = S{a: 1, b: null};

    init() {
        self.s = S{a: 42, b: null};
    }
}