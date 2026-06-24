struct SimpleNested {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    info: InfoStruct;
}

struct InfoStruct {
    id: Int;
    note: String;
}

contract TestContract {
    data: SimpleNested;

    init() {
        self.data = SimpleNested{
            inner: InnerStruct{
                flag: true,
                info: InfoStruct{
                    id: 77,
                    note: "deep",
                },
            },
        };
    }
}
