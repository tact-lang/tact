struct A {
    f1: Int = 1;
}

struct B {
    f2: A;
}

struct C {
    f3: B;
}

struct D {
    f4: C;
}

contract DeepFourLayerOptional {
    opt: D? = null;

    init() {
        self.opt = null;
    }
    receive(){}
}