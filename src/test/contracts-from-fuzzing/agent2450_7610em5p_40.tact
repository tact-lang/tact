// Contract with nested struct -> optional primitive
struct Inner {
    x: Int?;
}

contract OptPrimitiveNested {
    state: Inner;
    init() {
        self.state = Inner{ x: null };
    }
}
