struct DeepNested {
    level1: Int;
    level2: Bool?;
    level3: String;
    level4: Cell;
    level5: Address;
}

struct MediumNested {
    first: DeepNested;
    second: DeepNested;
    third: Bool;
}

struct HighNested {
    inner: MediumNested;
    status: Bool?;
}

contract TestFuzz {
    field: HighNested;

    init() {
        self.field = HighNested{
            inner: MediumNested{
                first: DeepNested{level1: 1, level2: true, level3: "a", level4: emptyCell(), level5: myAddress()},
                second: DeepNested{level1: 2, level2: null, level3: "b", level4: emptyCell(), level5: myAddress()},
                third: false,
            },
            status: null
        };
    }
}