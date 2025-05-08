struct NestedStruct {
    inner: InnerStruct;
    other: Int;
}

struct InnerStruct {
    x: Int;
    y: Bool;
}

contract TestContract {
    data: NestedStruct = NestedStruct{
        inner: InnerStruct{ x: 5, y:true }, other:42
    };
}