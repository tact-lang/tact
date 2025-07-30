struct NestedOptionalDeep {
    a: Level1?;
}

struct Level1 {
    b: Level2?;
}

struct Level2 {
    c: Level3?;
}

struct Level3 {
    flag: Bool;
    txt: String;
}

contract TestContract {
    data: NestedOptionalDeep;

    init() {
        self.data = NestedOptionalDeep{
            a: null,
        };
    }
}
