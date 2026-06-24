struct VeryDeepNested {
    inner: Deep;
    label: String;
}

struct Deep {
    nested: Inner;
    flag: Bool;
}

struct Inner {
    x: Int;
    y: Bool?;
    note: String;
}

contract VeryDeepContract {
    field: VeryDeepNested;

    init() {
        self.field = VeryDeepNested{
            inner: Deep{
                nested: Inner{
                    x: 99,
                    y: null,
                    note: "ok",
                },
                flag: true,
            },
            label: "deepdeep",
        };
    }
}