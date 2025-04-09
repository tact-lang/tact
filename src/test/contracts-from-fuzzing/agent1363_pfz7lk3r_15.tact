struct IntSubtypesStruct {
    a: Int as uint4;
    b: Int as int8;
    c: Int as coins;
}

contract IntSubtypes {
    data: IntSubtypesStruct;

    init() {
        self.data = IntSubtypesStruct{
            a: 7,
            b: -5,
            c: 1000000000,
        };
    }
}