struct NestedOptionalStruct {
    inner: OptionalInner?;
}

struct OptionalInner {
    n: Int;
    flag: Bool;
}

contract TestNestedOptionalStruct {
    data: NestedOptionalStruct;

    init() {
        self.data = NestedOptionalStruct{
            inner: OptionalInner{
                n: 5,
                flag: true
            }
        };
    }
}