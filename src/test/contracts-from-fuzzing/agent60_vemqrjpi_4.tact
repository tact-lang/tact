struct InnerStruct {
    a: Int;
    b: Int
}

struct OuterStruct {
    inner: InnerStruct;
    c: Int
}

contract TestNestedStruct {
    receive() {
        let s = OuterStruct{
            inner: InnerStruct { a: 10, b: 20 },
            c: 30
        };
    }
}
