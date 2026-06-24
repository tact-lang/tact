struct A { x: Int; }
struct B { y: Bool; }
struct C { s1: A; s2: B; }

contract TestCompound {
    compound: C;
    init() {
        self.compound = C{ s1:A{x:9}, s2:B{y:true} };
    }
}