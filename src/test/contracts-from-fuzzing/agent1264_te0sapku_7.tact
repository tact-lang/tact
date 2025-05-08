struct A {
    x: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

struct D {
    c: C;
}

struct E {
    d: D;
}

contract ChainContract {
    chain: E;
    
    init() {
        self.chain = E{ d: D{ c: C{ b: B{ a: A{ x: 42 }}}}};
    }
}
