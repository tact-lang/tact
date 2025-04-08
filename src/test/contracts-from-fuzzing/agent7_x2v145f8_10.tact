struct InnerStruct {
    a: Int;
    b: Int;
}

struct WrapperStruct {
    i0: InnerStruct;
    i1: InnerStruct;
    i2: InnerStruct;
    i3: InnerStruct;
    i4: InnerStruct;
    i5: InnerStruct;
    i6: InnerStruct;
    i7: InnerStruct;
    i8: InnerStruct;
    i9: InnerStruct;
}

contract Test10 {
    ws: WrapperStruct;

    init() {
        self.ws = WrapperStruct{
            i0: InnerStruct{a: 0, b: 0},
            i1: InnerStruct{a: 1, b: 1},
            i2: InnerStruct{a: 2, b: 2},
            i3: InnerStruct{a: 3, b: 3},
            i4: InnerStruct{a: 4, b: 4},
            i5: InnerStruct{a: 5, b: 5},
            i6: InnerStruct{a: 6, b: 6},
            i7: InnerStruct{a: 7, b: 7},
            i8: InnerStruct{a: 8, b: 8},
            i9: InnerStruct{a: 9, b: 9},
        };
    }
}