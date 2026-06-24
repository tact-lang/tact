struct Small {
    a: Int;
}

struct NestedChain1 {
    b: Small;
}

struct NestedChain2 {
    c: NestedChain1;
}

struct NestedChain3 {
    d: NestedChain2;
}

struct NestedChain4 {
    e: NestedChain3;
}

contract DeepChain {
    x: NestedChain4;

    init() {
        self.x = NestedChain4 {
            e: NestedChain3 {
                d: NestedChain2 {
                    c: NestedChain1 {
                        b: Small { a: 50 }
                    }
                }
            }
        };
    }
}