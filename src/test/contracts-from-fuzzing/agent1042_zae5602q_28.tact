struct OptNoDefault {
    n: Int?;
}

contract NullableDefault {
    s: OptNoDefault;
    init() {
        self.s = OptNoDefault{n:null};
    }
}