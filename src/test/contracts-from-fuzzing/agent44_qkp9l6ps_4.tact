struct NestedStruct {
    inner: Inner;
}

struct Inner {
    flag: Bool;
    text: String;
}

contract NestedStructFieldContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            inner: Inner{
                flag: false,
                text: "hello",
            },
        };
    }
}