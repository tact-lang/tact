struct BoolChain1 { b: Bool; }
struct BoolChain2 { inner: BoolChain1; }
struct BoolChain3 { inner: BoolChain2; }

contract ChainBoolean {
    data: BoolChain3;

    init() {
        self.data = BoolChain3{
            inner: BoolChain2{
                inner: BoolChain1{b:true}
            }
        };
    }
}