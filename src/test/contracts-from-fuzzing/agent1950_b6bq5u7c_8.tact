struct NestedStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Bool;
}

contract TestNestedStruct {
    val: NestedStruct;

    init() {
        self.val = NestedStruct{
            inner: InnerStruct{
                x: 99,
                y: false
            }
        };
    }
}
