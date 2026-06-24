struct OptChain {
    x: Int?;
    sub: Nested?;
}

struct Nested {
    f: Bool?;
}

contract ChainTest {
    v: OptChain = OptChain{ x: null, sub: null };

    init() {
        self.v = OptChain{ x: 77, sub: Nested{ f: true } };
    }
}