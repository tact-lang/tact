struct SimpleNested {
    inner: DeepNested;
}

struct DeepNested {
    num: Int;
    flag: Bool;
    txt: String;
}

contract TestContract {
    s: SimpleNested;

    init() {
        self.s = SimpleNested{
            inner: DeepNested{
                num: 42,
                flag: false,
                txt: "hello",
            }
        };
    }
}