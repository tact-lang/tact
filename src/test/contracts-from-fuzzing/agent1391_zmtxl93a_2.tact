struct A {
    x: Int = 1;
    y: Bool = true;
    z: String = "hello";
}

struct B {
    f1: A;
    f2: A;
}

contract StructArray {
    s: B;

    init() {
        self.s = B{
            f1: A{},
            f2: A{},
        };
    }
}