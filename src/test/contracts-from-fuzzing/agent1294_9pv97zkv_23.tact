struct InnerDefault {
    foo: Int = 7;
    bar: String = "bar";
}

struct OuterDefault {
    nest: InnerDefault = InnerDefault{};
}

contract NestedDefaultFields {
    st: OuterDefault = OuterDefault{};
    receive() {}
}