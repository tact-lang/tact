struct A { x: Int; }
struct B { y: Int; z: A; }
struct C { w: B; }
struct D { q: C; }

contract ChainNesting {
    r: D;

    init() {
        self.r = D{ q:C{ w:B{ y:1,z:A{ x:2 }}}};
    }
}