struct S1 { val: Int }
struct S2 { next: S1 }
struct S3 { next: S2 }

contract LongChain {
    chain: S3;
    init() {
        self.chain = S3{ next: S2{ next: S1{ val: 999 } } };
    }
}