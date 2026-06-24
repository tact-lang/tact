struct Flags {
    f: Bool;
    g: Bool?;
}

contract NestedOptionals {
    x: Int?;
    f: Flags?;

    init() {
        self.x = null;
        self.f = null;
    }
}