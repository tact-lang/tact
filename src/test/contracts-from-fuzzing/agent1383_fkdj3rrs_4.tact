struct NestedStruct {
    x: Int;
    inner: Inner;
}

struct Inner {
    flag: Bool;
    txt: String;
}

contract NestedStructContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            x: 10,
            inner: Inner{
                flag: false,
                txt: "hello",
            },
        };
    }
}
