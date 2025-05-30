struct DeepNested {
    val: Int;
    nest: InnerLevel;
}

struct InnerLevel {
    flag: Bool;
    info: InnerInner;
}

struct InnerInner {
    name: String;
    count: Int?;
}

contract NestedContract {
    info: DeepNested;

    init() {
        self.info = DeepNested{
            val: 1,
            nest: InnerLevel{
                flag: true,
                info: InnerInner{
                    name: "test",
                    count: null,
                },
            },
        };
    }
}
