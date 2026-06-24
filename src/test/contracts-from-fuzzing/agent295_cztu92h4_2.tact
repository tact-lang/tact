struct NestedStruct {
    a: Int;
    b: Bool;
    c: AnotherStruct;
}

struct AnotherStruct {
    x: Int;
    y: Bool;
}

contract DeepNestedTest {
    data: NestedStruct = NestedStruct{
        a: 1,
        b: true,
        c: AnotherStruct {
            x: 42,
            y: false,
        },
    };

    init() {
        self.data = NestedStruct{
            a: 2,
            b: false,
            c: AnotherStruct {
                x: 100,
                y: true,
            },
        };
    }

    receive() {
        self.data = self.data;
    }
}