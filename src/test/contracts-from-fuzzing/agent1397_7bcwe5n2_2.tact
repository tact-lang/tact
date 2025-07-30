struct NestedStruct {
    x: Int;
    y: Bool;
    z: Address;
}

contract TestContract {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            x: 5,
            y: false,
            z: myAddress(),
        };
    }

    receive() {
        let _ = self.nested.x + 1;
        let _ = self.nested.y;
        let _ = self.nested.z;
    }
}