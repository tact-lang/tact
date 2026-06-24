struct A {
    a: Int = 1;
    b: Bool = false;
}
struct B {
    x: Int = 2;
    y: Bool = true;
}

contract DiffStructs {
    s1: A = A{};
    s2: B = B{};

    init() {
        self.s1 = A{ a: 7, b:true };
        self.s2 = B{ x:11, y:false };
    }
}