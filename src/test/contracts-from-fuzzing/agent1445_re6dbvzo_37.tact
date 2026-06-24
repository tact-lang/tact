struct MultiNestedOpt {
    x: Int;
    sub1: SubOpt1?;
}

struct SubOpt1 {
    y: Int;
    sub2: SubOpt2?;
}

struct SubOpt2 {
    z: Int;
}

contract MultiNullableChain {
    data: MultiNestedOpt;

    init() {
        self.data = MultiNestedOpt{
            x: 1,
            sub1: SubOpt1{
                y: 2,
                sub2: SubOpt2{
                    z: 3,
                },
            },
        };
    }
}