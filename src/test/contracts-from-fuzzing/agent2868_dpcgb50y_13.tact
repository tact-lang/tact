struct OptionalDeep {
    chain: C?;
}

struct A {
    x: Int;
}

struct B {
    y: Int;
    subA: A;
}

struct C {
    z: Int;
    subB: B;
}

contract OptionalDeepChain {
    opt: OptionalDeep;
    
    init() {
        self.opt = OptionalDeep{};
    }
}