struct DeepNest {
    value: Int;
    innerOpt: Inner?;
}

struct Inner {
    flag: Bool;
    message: String;
}

contract DeepNestedState(
    deep: DeepNest?,
    ready: Bool,
) {
}