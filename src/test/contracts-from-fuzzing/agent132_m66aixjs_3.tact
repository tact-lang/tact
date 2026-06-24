struct DeepNested {
    a: Int?;
    b: Bool?;
}

struct Container {
    deep: DeepNested;
    c: Int;
    d: Bool;
    e: String;
}

contract TestContract {
    value: Container;

    init() {
        self.value = Container{
            deep: DeepNested{
                a: null,
                b: true,
            },
            c: 5,
            d: false,
            e: "deep",
        };
    }
}