struct NestedOptional {
    someVal: Int?;
    flag: Bool;
}

contract NestedTest {
    nested: NestedOptional;

    init() {
        self.nested = NestedOptional{
            someVal: null,
            flag: true,
        };
    }
}