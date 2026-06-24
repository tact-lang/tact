struct A { x: Int; }
struct B { y: Int; sub: A; }
struct C { z: Int; sub: B; }
struct D { t: Int; sub: C; }

contract MultiLevelCompose {
    comp: D;

    init() {
        self.comp = D{ t:1, sub:C{ z:2, sub:B{ y:3, sub:A{ x:4 } } } };
    }
}