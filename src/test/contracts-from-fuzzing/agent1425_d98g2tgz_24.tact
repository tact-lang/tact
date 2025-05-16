// test optional struct as param with defaulted nested optional
struct InnerDOpt {
    n: Int? = null;
}

struct ContainerOpt {
    inner: InnerDOpt? = null;
}

contract ParamNestedOpt(
    nested: ContainerOpt?
) {}