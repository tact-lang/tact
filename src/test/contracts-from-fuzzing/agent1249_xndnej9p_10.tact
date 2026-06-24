struct B {
    val: Int;
}

struct A {
    b: B;
}

contract BothOptional {
    aOpt: A?;
    bOpt: B?;

    init() {
        self.aOpt = null;
        self.bOpt = null;
    }
}