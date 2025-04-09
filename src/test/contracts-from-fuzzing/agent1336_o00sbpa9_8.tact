struct A { x: Int; }
struct B { x: A; }
struct C { x: B; }
struct D { x: C; }
struct E { x: D; }
struct F { x: E; }
struct G { x: F; }
contract DeepChain {
    val: G;

    init() {
        self.val = G{ x: F{ x: E{ x: D{ x: C{ x: B{ x: A{ x: 7 }}}}}}};
    }

    receive() {
        let _ = self.val;
    }
}