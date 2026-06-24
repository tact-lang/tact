struct Flags {
    f1: Bool;
    f2: Bool;
    f3: Bool;
}

contract BoolStruct {
    flags: Flags;

    init() {
        self.flags = Flags{ f1: true, f2: false, f3: true };
    }
}
