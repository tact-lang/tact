struct First {
    val: Int;
}

struct Second {
    wrapped: First;
}

struct Third {
    inner: Second;
}

struct Fourth {
    deep: Third;
}

contract StructChain {
    chain: Fourth;

    init() {
        self.chain = Fourth{
            deep: Third{
                inner: Second{
                    wrapped: First{
                        val: 12345
                    }
                }
            }
        };
    }
}