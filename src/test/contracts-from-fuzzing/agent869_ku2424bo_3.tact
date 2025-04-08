struct DeepNested {
    val: Int;
    flag: Bool;
}

struct Outer {
    inner: DeepNested;
    message: String;
    optionalNum: Int?;
}

contract DeepNestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: DeepNested{
                val: 99,
                flag: true,
            },
            message: "deep test",
            optionalNum: null,
        };
    }

    receive() {}
}
