struct Inner {
    optFlag: Bool?;
    label: String;
}

struct Outer {
    count: Int;
    nested: Inner;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            count: 99,
            nested: Inner{
                optFlag: true,
                label: "hi",
            },
        };
    }
}