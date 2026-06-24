message(99) InnerMsg {
    code: Int;
    flag: Bool;
}

struct InnerStruct {
    payload: InnerMsg;
    text: String;
}

struct OuterStruct {
    inner: InnerStruct;
    number: Int;
}

contract TestContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            inner: InnerStruct{
                payload: InnerMsg{ code: 42, flag: true },
                text: "deep",
            },
            number: 77,
        };
    }
}