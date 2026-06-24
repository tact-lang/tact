struct NestedOpt {
    maybeS: Inner?;
}

struct Inner {
    val: Int;
}

contract NestedOptionalStorage {
    field: NestedOpt;

    init() {
        self.field = NestedOpt{
            maybeS: null
        };
    }
}