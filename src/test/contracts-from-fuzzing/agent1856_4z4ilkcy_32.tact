struct DefaultChain1 { x: Int = 0 }
struct DefaultChain2 { v: DefaultChain1 }
struct DefaultChain3 { v: DefaultChain2 }

contract WithDefaultsNested {
    data: DefaultChain3;

    init() {
        self.data = DefaultChain3{
            v: DefaultChain2{
                v: DefaultChain1{}
            }
        };
    }
}
