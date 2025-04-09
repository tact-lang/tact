struct NestedOptionalStruct {
    nested: Level1?;
}

struct Level1 {
    level: Level2;
}

struct Level2 {
    v: Int;
}

contract OptionalStructChain {
    data: NestedOptionalStruct;

    init() {
        self.data = NestedOptionalStruct{
            nested: null
        };
    }
}