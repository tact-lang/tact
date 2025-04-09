struct OptBoolStruct {
    x: Bool?;
    y: Bool?;
    z: Bool?;
}

contract TestContract {
    optflags: OptBoolStruct;
    init() {
        self.optflags = OptBoolStruct{ x: null, y: null, z: null };
    }
}
