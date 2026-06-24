struct BoolStruct {
    x: Bool;
    y: Bool;
    z: Bool;
}

contract TestContract {
    flags: BoolStruct;
    init() {
        self.flags = BoolStruct{ x: true, y: false, z: true };
    }
}
