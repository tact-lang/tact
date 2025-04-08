struct Inner {
    flag: Bool;
    count: Int;
}

struct Outer {
    nested: Inner;
    enabled: Bool;
    text: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{
                flag: true,
                count: 42,
            },
            enabled: false,
            text: "hello",
        };
    }
}