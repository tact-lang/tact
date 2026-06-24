struct A {
    x: Int;
}

struct B {
    optA: A?;
    y: Int;
}

contract OptMidStruct {
    b: B;

    init() {
        self.b = B{ optA:null, y:7 };
    }
}