struct InnerMost {
    val: Int;
}

struct Second {
    inner: InnerMost;
}

struct First {
    second: Second;
}

contract LongNestedChain {
    storage: First;

    init() {
        self.storage = First{
            second: Second{
                inner: InnerMost{ val: 99 }
            }
        };
    }
}