struct Inner {
    flag: Bool;
    count: Int?;
}

struct Outer {
    inner: Inner;
    label: String;
    enabled: Bool;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                flag: true,
                count: null,
            },
            label: "test",
            enabled: false,
        };
    }
}