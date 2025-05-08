struct OptionalAddress {
    a: Address?;
}

struct OptionalString {
    s: String?;
}

struct Mixed {
    p: OptionalAddress;
    q: OptionalString;
}

contract OptNestedMix {
    m: Mixed;

    init() {
        self.m = Mixed{
            p: OptionalAddress{ a: null },
            q: OptionalString{ s: null }
        };
    }
}