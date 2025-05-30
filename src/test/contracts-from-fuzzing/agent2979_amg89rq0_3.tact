struct A { a: Int; }
struct B { b: A; }
struct C { c: B; }
struct D { d: C; }
struct E { e: D; }

contract Chain {
    val: E;
    init() {
        self.val = E{ e: D{ d:C{ c:B{ b:A{ a:42 } } } } };
    }
}