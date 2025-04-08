struct Inner {
    id: Int;
    flag: Bool;
    label: String;
    extra: String?;
}

struct Outer {
    field: Inner;
    count: Int;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{ field: Inner{ id: 101, flag: true, label: "test", extra: null }, count: 88 };
    }
}