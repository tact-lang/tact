struct OptDeep {
    maybeDeep: Deep?;
    valid: Bool;
}

struct Deep {
    inner: Outer;
    num: Int;
}

struct Nested {
    x: Int;
    y: Int?;
}

struct Outer {
    nested: Nested;
    flag: Bool;
    text: String;
}

contract TestContract {
    od: OptDeep;

    init() {
        self.od = OptDeep {
            maybeDeep: null,
            valid: true
        };
    }
}