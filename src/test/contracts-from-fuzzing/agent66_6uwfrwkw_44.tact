struct ChainA {
    x: Int;
}

struct ChainB {
    a: ChainA;
}

contract InlineNestedInit {
    val: ChainB;

    init() {
        self.val = ChainB{ a: ChainA{ x: 42 } };
    }
}