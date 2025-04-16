struct NestedOpt {
    innerOpt: Inner?;
}

struct Inner {
    val: Int;
    flag: Bool;
}

contract OptNested {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            innerOpt: Inner{
                val: 10,
                flag: true,
            },
        };
    }
}