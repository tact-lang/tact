struct A { x: Int; y: Int; }
struct B { a: A; z: Int; }
struct C { b: B; flag: Bool; }

contract ChainNesting {
    s: C;

    init() {
        self.s = C{ b: B{ a: A{ x: 1, y:2 }, z: 3 }, flag: true };
    }

    receive() {
        if (self.s.flag) {
            self.s.b.a.x += 10;
        } else {
            self.s.flag = true;
        }
    }
}