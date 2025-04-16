struct BoolChain1 { b: Bool }
struct BoolChain2 { inner: BoolChain1 }
struct BoolChain3 { inner: BoolChain2 }

contract BoolNested {
    val: BoolChain3;
    init() {
        self.val = BoolChain3{ inner: BoolChain2{ inner: BoolChain1{b:true} } };
    }
}