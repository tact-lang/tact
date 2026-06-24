struct A { b: B }
struct B { c: C }
struct C { d: D? }
struct D { e: E? }
struct E { val: Int? }

contract ChainOptional {
    a: A;

    init() {
        self.a = A{ b: B{ c: C{ d: null } } };
    }
}