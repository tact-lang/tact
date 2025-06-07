struct MyStruct {
    foo: Int;
    bar: Bool;
}

contract NestedTest {
    s1: MyStruct;
    s2: MyStruct?;

    init() {
        self.s1 = MyStruct{ foo: 7, bar: true };
        self.s2 = null;
    }
}