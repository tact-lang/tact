struct NestedStruct {
    a: Int;
    b: Bool?;
    s: String;
}

struct OuterStruct {
    inner: NestedStruct;
    flag: Bool;
}

contract NestedContract {
    data: OuterStruct;
    init() {
        self.data = OuterStruct{
            inner: NestedStruct{
                a: 10,
                b: null,
                s: "deep",
            },
            flag: false,
        };
    }
}
