contract TestContract {
    flags: FlagsStruct;

    init() {
        self.flags = FlagsStruct{
            a: true,
            b: false,
            c: true,
            d: true,
            e: false
        };
    }
}

struct FlagsStruct {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
}
