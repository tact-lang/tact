struct BasicStruct {
    x: Int;
    y: Bool;
}

contract StructInitTest {
    foo: BasicStruct;

    init() {
        self.foo = BasicStruct{
            x: 1,
            y: true
        };
    }
}