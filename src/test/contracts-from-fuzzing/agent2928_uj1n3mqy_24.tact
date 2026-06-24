struct ComplexOpt {
    a: Int? = null;
    b: Bool? = null;
}

struct ContainerComplexOpt {
    f: ComplexOpt = ComplexOpt{};
}

contract NestedDefaultOpts {
    s: ContainerComplexOpt = ContainerComplexOpt{};
}