struct Inner {
    flag: Bool;
    count: Int;
}

contract NestedFieldTest {
    nestedStruct: Inner;

    init() {
        self.nestedStruct = Inner{
            flag: true,
            count: 123
        };
    }
}