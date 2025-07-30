struct DeepNested {
    a: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    text: String;
}

contract DeepTest {
    d: DeepNested;

    init() {
        self.d = DeepNested{
            a: 5,
            inner: InnerStruct{flag: true, text: "ok"}
        };
    }
}
