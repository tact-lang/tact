struct Inner {
    enabled: Bool;
    note: String?;
}

struct Container {
    idx: Int;
    item: Inner?;
    meta: String;
}

contract Test {
    field: Container;

    init() {
        self.field = Container{
            idx: 42,
            item: null,
            meta: "done"
        };
    }
}