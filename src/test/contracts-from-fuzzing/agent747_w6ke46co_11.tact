contract TestContract {
    strct: FlatStruct;

    init() {
        self.strct = FlatStruct{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
            e: 5
        };
    }
}

struct FlatStruct {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
}
