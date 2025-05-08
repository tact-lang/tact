struct BoolStruct {
    x: Bool;
    y: Bool;
    z: Bool;
}

contract TestContract {
    s: BoolStruct;

    init() {
        self.s = BoolStruct{x: true, y: false, z: true};
    }
}