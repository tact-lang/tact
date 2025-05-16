struct InnerMost {
    val: Int;
}

struct OuterOpt {
    val: InnerMost?;
}

contract NestedInsideOptional {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            val: InnerMost{ val: 42 },
        };
    }
}