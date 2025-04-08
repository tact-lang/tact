struct A { x: Int = 1; }
struct B { y: Int = 2; }
struct C { z: Int = 3; }
struct D { a: A; b: B; c: C; }

contract Test {
    data: D = D{ a: A{ x: 10 }, b: B{ y: 20 }, c: C{ z: 30 } };

    init() {
        self.data = D{ a: A{ x: 100 }, b: B{ y: 200 }, c: C{ z: 300 } };
    }
}