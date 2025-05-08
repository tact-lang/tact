struct EmptyOptional {
    val: Int?;
}

struct Container {
    field: EmptyOptional;
}

contract NestedNullOpt {
    data: Container;

    init() {
        self.data = Container{ field: EmptyOptional{ val: null } };
    }
}
