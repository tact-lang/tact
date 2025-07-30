struct LongChainA { next: LongChainB; }
struct LongChainB { next: LongChainC; }
struct LongChainC { next: LongChainD; }
struct LongChainD { num: Int; }

contract ManyNestedLevels {
    chain: LongChainA;
    init() {
        self.chain = LongChainA{ next: LongChainB{ next: LongChainC{ next: LongChainD{ num: 7 } } } };
    }
}