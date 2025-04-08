struct BoolStruct {
    b1: Bool;
    b2: Bool;
    b3: Bool?;
}

contract PersistentBools {
    s: BoolStruct;

    init() {
        self.s = BoolStruct{
            b1: true,
            b2: false,
            b3: null
        };
    }
}
