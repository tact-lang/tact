struct NestedStruct1 {
    a: Int;
    b: Bool;
}

struct NestedStruct2 {
    ns1: NestedStruct1;
    s: String;
}

contract NestedInPersistent {
    data: NestedStruct2;

    init() {
        self.data = NestedStruct2{
            ns1: NestedStruct1{
                a: 42,
                b: true
            },
            s: "ok"
        };
    }
}