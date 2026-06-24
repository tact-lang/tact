struct Flags {
    f1: Bool = false;
    f2: Bool = true;
    f3: Bool = false;
    f4: Bool = true;
    f5: Bool = false;
    f6: Bool = true;
    f7: Bool = false;
    f8: Bool = true;
}

struct FlagGroup {
    a: Flags;
    b: Flags;
}

contract ManyBits {
    bits: FlagGroup;

    init() {
        self.bits = FlagGroup{
            a: Flags{},
            b: Flags{},
        };
    }

    receive() { dump(0); }
}