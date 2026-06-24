struct InnerOpt {
    value: Int;
}

struct OuterOpt {
    inner: InnerOpt?;
    value: Int;
}

struct DeepOpt1 {
    outer: OuterOpt;
    f: Int;
}

struct DeepOpt2 {
    deep: DeepOpt1;
    f: Int;
}

contract TestContract {
    receive() {
        let d: DeepOpt2 = DeepOpt2{
            deep: DeepOpt1{
                outer: OuterOpt{
                    inner: InnerOpt{ value: 42 },
                    value: 7
                },
                f: 1
            },
            f: 99
        };
    }
}
