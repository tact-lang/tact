struct ParamA {
    x: Int;
}

struct ParamB {
    y: ParamA;
}

struct ParamC {
    z: ParamB;
}

contract DeepNest {
    value: ParamC;

    init() {
        self.value = ParamC{ z: ParamB{ y: ParamA{ x: 123 } } };
    }
}