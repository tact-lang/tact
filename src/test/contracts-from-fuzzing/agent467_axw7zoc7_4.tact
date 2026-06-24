struct NestedStruct {
    inner: Inner;
}

struct Inner {
    flag: Bool;
    data: DataStruct;
}

struct DataStruct {
    num: Int;
    text: String;
    optionalBool: Bool?;
}

contract TestContract {
    ns: NestedStruct;

    init() {
        self.ns = NestedStruct{
            inner: Inner{
                flag: true,
                data: DataStruct{
                    num: 123,
                    text: "testing",
                    optionalBool: null,
                },
            },
        };
    }
}