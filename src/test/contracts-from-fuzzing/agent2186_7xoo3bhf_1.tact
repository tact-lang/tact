struct NestedStruct {
    s: SubStruct;
}

struct SubStruct {
    flag: Bool;
    number: Int;
}

contract DeepNestedTest {
    n: NestedStruct;

    init() {
        self.n = NestedStruct{
            s: SubStruct{
                flag: true,
                number: 42,
            },
        };
    }
}
