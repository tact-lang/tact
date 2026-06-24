struct A {
    b: Int;
}

struct B {
    c: A;
}

struct C {
    d: B;
}

struct D {
    e: C;
}

struct E {
    f: D;
}

struct F {
    g: E;
}

struct G {
    h: F;
}

struct H {
    i: G;
}

contract NestedStructsDepth8 {
    data: H;
    init() {
        self.data = H{ i: G{ h: F{ g: E{ f: D{ e: C{ d: B{ c: A{ b: 42 } } } } } } } };
    }
}