struct InnerStruct {
    a: Int;
}

struct OuterStruct {
    inner: InnerStruct;
}

contract NestedStructTest {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{inner: InnerStruct{a:1}};
    }
}