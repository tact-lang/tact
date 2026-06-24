struct Inner1 {
    a: Int;
}
struct Inner2 {
    b: Int;
}

struct Comb {
    x: Inner1;
    y: Inner2;
}

contract Test {
    c: Comb;
    init() {
        self.c = Comb{
            x: Inner1{ a: 2 },
            y: Inner2{ b: 3 }
        };
    }
    receive() { let _ = self.c.x.a + self.c.y.b; }
}