struct Inner { a: Int; b: Int? }

struct Outer { inr: Inner; val: Int }

contract DeepStructTest {
    s: Outer;

    init() {
        self.s = Outer{ inr: Inner{ a: 10, b: null }, val: 42 };
    }
}