struct A { b: B; }
struct B { c: C; }
struct C { d: D; }
struct D { e: E; }
struct E { f: F; }
struct F { val: Int; }

contract Chain {
    ch: A;
    init() {
        self.ch = A{ b: B{ c: C{ d: D{ e: E{ f: F{ val: 1 } } } } } };
    }
    receive() {}
}