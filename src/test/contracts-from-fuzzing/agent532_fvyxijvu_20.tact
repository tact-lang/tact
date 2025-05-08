struct SimpleStruct {
    a: Int;
    b: Bool;
}

contract UnsetFieldTest {
    foo: SimpleStruct;

    init() {
        self.foo = SimpleStruct{
            a: 5,
            b: true
        };
    }
}