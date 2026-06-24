struct Flags {
    f0: Bool?;
    f1: Bool?;
    f2: Bool?;
    f3: Bool?;
    f4: Bool?;
    f5: Bool?;
    f6: Bool?;
    f7: Bool?;
    f8: Bool?;
    f9: Bool?;
}

contract TestContract {
    flags: Flags;

    init() {
        self.flags = Flags{
            f0: null, f1: null, f2: null, f3: null, f4: null,
            f5: null, f6: null, f7: null, f8: null, f9: null
        };
    }
}