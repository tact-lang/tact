struct Inner {
    fieldA: Int;
    fieldB: Bool;
}

contract TestContract {
    nestedStruct: Inner;

    init() {
        self.nestedStruct = Inner{
            fieldA: 1,
            fieldB: true,
        };
    }
}