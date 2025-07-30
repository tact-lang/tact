contract TestContract {
    strct: PackedStruct;

    init() {
        self.strct = PackedStruct{
            b1: true,
            i1: 1,
            b2: false,
            i2: 2
        };
    }
}

struct PackedStruct {
    b1: Bool;
    i1: Int;
    b2: Bool;
    i2: Int;
}
