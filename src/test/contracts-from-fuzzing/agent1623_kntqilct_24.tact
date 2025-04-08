struct BoolChain1 { f: Bool; }
struct BoolChain2 { f: Bool; next: BoolChain1; }
struct BoolChain3 { f: Bool; next: BoolChain2; }
struct BoolChain4 { f: Bool; next: BoolChain3; }
struct BoolChain5 { f: Bool; next: BoolChain4; }

contract ChainBooleans {
    data: BoolChain5;
    init() {
        self.data = BoolChain5{
            f:true, next:BoolChain4{
                f:false, next:BoolChain3{
                    f:true, next:BoolChain2{
                        f:false, next:BoolChain1{
                            f:true
                        }
                    }
                }
            }
        };
    }
}