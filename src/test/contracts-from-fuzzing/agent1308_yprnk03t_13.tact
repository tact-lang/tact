struct Flags {
    f1: Bool;
    f2: Bool;
    f3: Bool;
    f4: Bool;
}

struct OptionalFlags {
    o1: Flags?;
    o2: Flags?;
}

contract TestContract {
    data: OptionalFlags;

    init() {
        self.data = OptionalFlags {
            o1: null,
            o2: null
        };
    }
}