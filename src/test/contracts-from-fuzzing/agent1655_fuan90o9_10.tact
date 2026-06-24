struct LongNestedChain1 {
    val: Int;
    next: LongNestedChain2;
}

struct LongNestedChain2 {
    val: Int;
    next: LongNestedChain3;
}

struct LongNestedChain3 {
    val: Int;
    next: LongNestedChain4;
}

struct LongNestedChain4 {
    val: Int;
}

contract TestLongChain {
    data: LongNestedChain1;

    init() {
        self.data = LongNestedChain1{
            val:1,
            next: LongNestedChain2{
                val:2,
                next: LongNestedChain3{
                    val:3,
                    next: LongNestedChain4{
                        val:4
                    }
                }
            }
        };
    }
}
