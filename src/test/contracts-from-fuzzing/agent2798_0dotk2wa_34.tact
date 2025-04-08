struct OptChain1 { a: OptChain2?; }
struct OptChain2 { b: OptChain3?; }
struct OptChain3 { c: Int?; }

contract OptionalChainContract {
    data: OptChain1;

    init() {
        self.data = OptChain1{
            a: OptChain2{
                b: OptChain3{
                    c: null
                }
            }
        };
    }
}