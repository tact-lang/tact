struct StrChain1 { val: String; }
struct StrChain2 { val: StrChain1; }
struct StrChain3 { val: StrChain2; }

contract StringChains {
    deepstring: StrChain3;
    init() {
        self.deepstring = StrChain3{
            val: StrChain2{
                val: StrChain1{ val: "deep" }
            }
        };
    }
}