struct A {
    x: Int?;
}

contract SetOptLate {
    foo: A;

    init() {
        self.foo = A{ x:null };
        self.foo = A{ x:5 };
    }
}