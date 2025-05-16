struct LongChain1 { val: Int; }
struct LongChain2 { c: LongChain1; }
struct LongChain3 { c: LongChain2; }
struct LongChain4 { c: LongChain3; }
struct LongChain5 { c: LongChain4; }

contract DeepChain {
    d: LongChain5;

    init() {
        self.d = LongChain5{ c: LongChain4{ c: LongChain3{ c: LongChain2{ c: LongChain1{val:1}}}}};
    }
}