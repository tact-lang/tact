struct BoolChain3 {
    f1: Bool;
    f2: Bool;
    f3: Bool;
}

struct BoolChain2 {
    inner: BoolChain3;
    end: Bool;
}

struct BoolChain1 {
    inner: BoolChain2;
}

contract NestedBoolChain {
    data: BoolChain1;
    
    init() {
        self.data = BoolChain1{ inner: BoolChain2{ inner: BoolChain3{
            f1:true, f2:false, f3:true
        }, end:false } };
    }
}