struct A {
    x: Int;
}

contract StructDefault {
    s: A = A{ x:5 };

    init() {
        self.s = A{ x:42 };
    }
}