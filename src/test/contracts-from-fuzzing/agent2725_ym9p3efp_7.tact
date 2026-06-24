struct A { x: Int; y: Bool; }
struct B { z: A; }
struct C { l: B; }
struct D { m: C; }
struct E { n: D; }
struct F { o: E; }

contract ChainSix {
    data: F?;

    init() {
        self.data = null;
    }
}