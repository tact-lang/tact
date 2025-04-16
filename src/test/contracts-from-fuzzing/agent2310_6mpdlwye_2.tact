struct DeepNested {
    a: Int;
    b: Int?;
    c: Bool;
}

struct Wrapper {
    nested: DeepNested;
    optNested: DeepNested?;
}

contract FuzzTest {
    value: Wrapper;

    init() {
        self.value = Wrapper{
            nested: DeepNested{ a: 1, b: null, c: true },
            optNested: null
        };
    }
}