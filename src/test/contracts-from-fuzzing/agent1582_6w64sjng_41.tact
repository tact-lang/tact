// Deeply nested optional chain
struct A { b: B?; }
struct B { c: C?; }
struct C { d: D?; }
struct D { val: Int; }

contract ChainOptionals {
    root: A;
    init() {
        self.root = A{ b: B{ c: C{ d: null } } };
    }
}