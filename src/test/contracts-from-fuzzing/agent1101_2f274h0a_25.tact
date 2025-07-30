struct A {
    foo: Int;
}

contract DefaultStructVar {
    x: A = A{ foo: 42 };
    
    init() {
        self.x = A{ foo: 99 };
    }
}