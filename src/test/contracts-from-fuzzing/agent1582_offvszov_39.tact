struct NestedWrap {
    deep: DeepOpt?;
}

struct DeepOpt {
    value: Int?;
}

contract NestedOptWrap {
    n: NestedWrap = NestedWrap {
        deep: DeepOpt {
            value: null
        }
    };

    receive() {}
}