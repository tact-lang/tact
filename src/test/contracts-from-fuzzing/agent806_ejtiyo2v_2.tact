struct NestedStruct {
    x: Int;
    y: Bool;
    z: Address;
}

contract TestContract {
    data: NestedStruct;
    init() {
        self.data = NestedStruct{ x: 3, y: false, z: myAddress() };
    }
}