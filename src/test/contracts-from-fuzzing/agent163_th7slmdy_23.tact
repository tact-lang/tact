struct BaseStruct {
    a: Int;
}

struct NestedLevel {
    nested: BaseStruct;
    b: Bool;
}

contract MultiLevel {
    s: NestedLevel;

    init() {
        self.s = NestedLevel{
            nested: BaseStruct{ a: 24 },
            b: false
        };
    }
}