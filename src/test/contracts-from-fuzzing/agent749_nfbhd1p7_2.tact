struct NestedStruct {
    x: Int;
    y: Bool;
    z: Address;
}

contract TestContract {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            x: 1,
            y: true,
            z: myAddress(),
        };
    }

    receive() {
        let _ = self.nested.x;
    }
}