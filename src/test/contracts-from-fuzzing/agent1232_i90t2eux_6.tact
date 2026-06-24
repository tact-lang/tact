struct LongChain1 { next: LongChain2; }
struct LongChain2 { next: LongChain3; }
struct LongChain3 { next: LongChain4; }
struct LongChain4 { next: LongChain5; }
struct LongChain5 { val: Int; }

contract LongNested {
    chain: LongChain1;

    init() {
        self.chain = LongChain1{ next: LongChain2{ next: LongChain3{ next: LongChain4{ next: LongChain5{ val: 1 } } } } };
    }
}