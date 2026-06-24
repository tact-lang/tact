// Nested optional inside flat optional struct
struct OptLevel {
    foo: Int?;
    bar: NestedOpt?;
}

struct NestedOpt {
    x: Int;
    y: Bool;
}

contract OptionalCombo {
    data: OptLevel;

    init() {
        self.data = OptLevel { foo:null, bar:null };
    }
}