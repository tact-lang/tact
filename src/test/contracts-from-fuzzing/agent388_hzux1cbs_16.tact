struct OptBool {
    f: Bool?;
}

struct OptNested {
    inner: OptBool?;
}

contract OptionalStructOfOptional {
    s: OptNested;
    init() {
        self.s = OptNested{ inner: null };
    }
}