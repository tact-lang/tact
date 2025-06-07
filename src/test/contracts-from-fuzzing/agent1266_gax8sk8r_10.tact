struct InnerMost {
    a: Int = 1;
}

struct Middle {
    m: Int? = null;
    deep: InnerMost = InnerMost{};
}

struct Container {
    mid: Middle? = null;
    label: String = "foo";
}

contract NestedOptStructs {
    state: Container = Container{mid: null, label: "bar"};

    init() {}
}