struct InnerNestedStruct {
    a: Bool;
    b: Int?;
}

struct OuterNestedStruct {
    x: Int;
    y: InnerNestedStruct;
}

contract DeepNestedTest {
    val: OuterNestedStruct;

    init() {
        self.val = OuterNestedStruct{
            x: 123,
            y: InnerNestedStruct{
                a: true,
                b: null,
            },
        };
    }
}