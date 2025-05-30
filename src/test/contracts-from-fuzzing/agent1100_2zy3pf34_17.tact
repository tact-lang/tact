struct A {
    f1: Int;
    f2: Bool;
}

struct B {
    x: A;
    y: Bool;
}

contract OrderTest {
    field: B;

    init() {
        self.field = B{
            x: A{ f1:10, f2:true },
            y: false
        };
    }
}
