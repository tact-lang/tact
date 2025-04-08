struct NestedDefault {
    a: Int;
    b: Int = 5;
    c: InnerStruct;
}

struct InnerStruct {
    d: Int;
    e: Int = 7;
}

contract NestedDefaultsTest {
    data: NestedDefault;

    init() {
        self.data = NestedDefault{
            a: 1,
            c: InnerStruct{
                d: 2
            }
        };
    }
}
