struct B {
    a: Int;
    b: String;
}

contract MultipleStructs {
    s1: B;
    s2: B;
    x: Int;

    init() {
        self.s1 = B{a:1,b:"a"};
        self.s2 = B{a:2,b:"b"};
        self.x = 99;
    }
}