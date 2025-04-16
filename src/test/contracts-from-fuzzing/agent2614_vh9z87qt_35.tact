struct NestedChain1 {
    f: Int?;
}

struct NestedChain2 {
    nested: NestedChain1?;
}

struct NestedChain3 {
    nested: NestedChain2?;
}

contract DeepNullChain {
    data: NestedChain3;

    init() {
        self.data = NestedChain3{
            nested: null
        };
    }
}