struct Flags {
    f1: Bool;
    f2: Bool;
    f3: Bool;
    f4: Bool;
    f5: Bool;
}

struct FlagsContainer {
    flags: Flags;
}

contract FlagsNestedTest {
    data: FlagsContainer;

    init() {
        self.data = FlagsContainer{
            flags: Flags{
                f1: true,
                f2: false,
                f3: true,
                f4: false,
                f5: true,
            }
        };
    }
}
