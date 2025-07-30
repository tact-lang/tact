struct DeepNested {
    foo: Int;
    bar: Bool;
}

struct Middle {
    d: DeepNested;
    val: String;
    flag: Bool;
}

struct Top {
    m: Middle;
    count: Int;
}

contract DeepNestedContract {
    data: Top;

    init() {
        self.data = Top{
            m: Middle{
                d: DeepNested{
                    foo: 7,
                    bar: false
                },
                val: "hello",
                flag: true
            },
            count: 42
        };
    }
}
