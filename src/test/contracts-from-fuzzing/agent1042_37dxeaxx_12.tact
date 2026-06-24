struct ScalarFields {
    i: Int;
    b: Bool;
    s: String;
}

struct NestedScalars {
    nested: ScalarFields;
    i2: Int;
}

contract MixedNesting {
    x: NestedScalars;
    init() {
        self.x = NestedScalars{
            nested: ScalarFields{i:7,b:true,s:"hi"},
            i2: 8
        };
    }
}