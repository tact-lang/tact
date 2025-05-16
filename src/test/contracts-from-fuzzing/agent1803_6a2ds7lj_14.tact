struct OuterOpt {
    inner: InnerOpt?;
}

struct InnerOpt {
    leaf: Int?;
}

contract NestedOptionalStorage {
    data: OuterOpt;
    
    init() {
        self.data = OuterOpt {
            inner: InnerOpt {
                leaf: 5
            }
        };
    }
}