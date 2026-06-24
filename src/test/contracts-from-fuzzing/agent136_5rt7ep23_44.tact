struct OptUint4 {
    a: Int? as uint4;
}

contract OptionalUint4 {
    dat: OptUint4;

    init() {
        self.dat = OptUint4{ a: null };
    }
}