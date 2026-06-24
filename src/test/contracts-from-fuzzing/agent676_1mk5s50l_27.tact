struct BoolChain {
    flag1: Bool;
    next: BoolChain2;
}

struct BoolChain2 {
    flag2: Bool;
    next: BoolChain3;
}

struct BoolChain3 {
    flag3: Bool;
}

contract DeepBoolChain {
    data: BoolChain;

    init() {
        self.data = BoolChain{
            flag1:true,
            next: BoolChain2{
                flag2: false,
                next: BoolChain3{flag3:true}
            }
        };
    }
}