struct NestedFlags {
    a: Bool;
    b: SubFlags;
}

struct SubFlags {
    b1: Bool?;
    b2: Bool;
}

contract FlagsContract {
    flags: NestedFlags;
    init() {
        self.flags = NestedFlags{
            a: true,
            b: SubFlags{
                b1: null,
                b2: false
            }
        };
    }
}