struct NestedMessage {
    inner: InnerStruct;
}

struct InnerStruct {
    a: Int;
    b: Bool;
    c: Address;
    d: String?;
}

contract StructInStruct {
    field: NestedMessage;

    init() {
        self.field = NestedMessage{
            inner: InnerStruct{ a: 55, b: true, c: myAddress(), d: null }
        };
    }
}