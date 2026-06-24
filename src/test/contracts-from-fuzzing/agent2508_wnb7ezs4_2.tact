struct OptionalNesting {
    inner: Int?;
    inner2: Int?;
    inner3: Bool?;
    
    nestedStruct: NestedOptional?
}

struct NestedOptional {
    val: Int?;
    deeper: DeeperOptional?;
}

struct DeeperOptional {
    val: Int;
}

contract OptionalStructTest {
    opt: OptionalNesting;

    init() {
        self.opt = OptionalNesting{
            inner: null,
            inner2: 123,
            inner3: true,
            nestedStruct: NestedOptional{
                val: null,
                deeper: DeeperOptional{
                    val: 1
                }
            }
        };
    }
}
