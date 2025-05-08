struct A { f: Int }
struct B { g: A }
struct C { h: B }
struct D { i: C }
contract Chain4 {
    d: D;
    init() {
        self.d = D{ i: C{ h: B{ g: A{ f: 7 } } } };
    }
}