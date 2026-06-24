struct Outer {
    value: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    text: String;
    flag: Bool;
}

contract DeepFields {
    o: Outer;
    init() {
        self.o = Outer{
            value: 77,
            inner: InnerStruct{
                text: "test",
                flag: false,
            },
        };
    }
}
