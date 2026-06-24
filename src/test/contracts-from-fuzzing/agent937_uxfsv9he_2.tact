struct NestedStruct {
    foo: Int;
    bar: Bool;
    nested: InnerNested;
}

struct InnerNested {
    x: Int;
    y: Int?;  
    flag: Bool;
}

contract NestedTest {
    ns: NestedStruct;

    init() {
        self.ns = NestedStruct{
            foo: 5,
            bar: true,
            nested: InnerNested{
                x: 1,
                y: null,
                flag: false
            }
        };
    }
}