struct NestedStruct {
    i: Int;
    s: String;
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    addr: Address;
}

contract Combo {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            i: 1,
            s: "hello",
            inner: InnerStruct{
                flag: true,
                addr: myAddress()
            }
        };
    }
}
