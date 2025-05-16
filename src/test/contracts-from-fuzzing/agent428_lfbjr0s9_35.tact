struct Deep {
    a: Int as int16;
    b: Int as uint32;
    c: Int = 42;
}

struct Mid {
    d: Deep?;
    label: String;
}

struct Top {
    mid: Mid?;
    enabled: Bool;
}

contract TestContract {
    nested: Top?;

    init() {
        self.nested = null;
    }
}