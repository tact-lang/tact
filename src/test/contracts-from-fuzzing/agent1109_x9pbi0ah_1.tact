struct InnerStruct {
    nestedInt: Int;
    nestedBool: Bool;
}

struct OuterStruct {
    inner: InnerStruct;
    outerBool: Bool;
}

contract NestedStructTest {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            inner: InnerStruct{nestedInt: 1, nestedBool: true},
            outerBool: false
        };
    }
}