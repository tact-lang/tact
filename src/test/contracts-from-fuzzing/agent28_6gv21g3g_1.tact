struct InnerStruct {
    a: Int;
    b: Bool?;
}

struct OuterStruct {
    s: InnerStruct;
    flag: Bool;
}

contract NestedStructTest {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            s: InnerStruct{ a: 10, b: null },
            flag: true
        };
    }
}