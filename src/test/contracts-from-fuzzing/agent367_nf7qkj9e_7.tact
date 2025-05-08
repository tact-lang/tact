struct NestedOpt {
    foo: NestedOpt2?;
}

struct NestedOpt2 {
    bar: NestedOpt3?;
}

struct NestedOpt3 {
    num: Int;
    flag: Bool;
}

contract TestNestedOpt {
    val: NestedOpt;

    init() {
        self.val = NestedOpt{
            foo: NestedOpt2{
                bar: NestedOpt3{
                    num: 13,
                    flag: false,
                }
            }
        };
    }
}