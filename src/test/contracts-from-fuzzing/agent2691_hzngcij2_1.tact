struct NestedStruct {
    a: Int;
    b: Bool;
}

struct OuterStruct {
    x: Int;
    y: NestedStruct;
}

contract NestedTest {
    s: OuterStruct;

    init() {
        self.s = OuterStruct{
            x: 10,
            y: NestedStruct{
                a: 1,
                b: true
            }
        };
    }
}
