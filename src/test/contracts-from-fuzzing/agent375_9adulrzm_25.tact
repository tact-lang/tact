struct A {
    x: Int;
    y: Int;
}

contract Test1 {
    a1: A;
    a2: A;

    init() {
        self.a1 = A{x:1,y:2};
        self.a2 = A{x:3,y:4};
    }
}
