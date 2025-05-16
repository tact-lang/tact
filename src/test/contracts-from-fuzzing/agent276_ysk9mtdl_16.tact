struct Flags {
    x: Bool;
    y: Bool;
    z: Bool;
}

struct OptFlags {
    fx: Flags?;
    name: String;
}

contract OptionalFlags {
    data: OptFlags;

    init() {
        self.data = OptFlags{
            fx: Flags{x: false, y: true, z: true},
            name: "flags"
        };
    }
}
