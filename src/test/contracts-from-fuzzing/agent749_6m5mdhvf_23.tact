struct OptChain1 {
    a: Int?;
}

struct OptChain2 {
    b: OptChain1?;
}

contract NullableChain {
    state: OptChain2;

    init() {
        self.state = OptChain2{
            b: null
        };
    }
}