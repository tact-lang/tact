struct MixedNestedOptionals {
    a: Int?;
    b: Bool;
    c: InnerStruct?;
}

struct InnerStruct {
    d: Int;
    e: Bool?;
}

contract MixedOptionals {
    m: MixedNestedOptionals;
    init() {
        self.m = MixedNestedOptionals{ a: null, b: false, c: InnerStruct{ d: 1, e: null } };
    }
}
