struct OptInner {
    i: Int?;
}

struct Container {
    field: OptInner;
}

contract StructDefaults {
    data: Container = Container{ field: OptInner{ i: null } };
}