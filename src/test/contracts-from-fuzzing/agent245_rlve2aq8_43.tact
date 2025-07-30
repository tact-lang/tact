struct InnerStruct {
    foo: Int;
    bar: Bool;
}

contract AssignInnerTest {
    s: InnerStruct;

    init() {
        self.s = InnerStruct{ foo: 5, bar: true };
    }
}