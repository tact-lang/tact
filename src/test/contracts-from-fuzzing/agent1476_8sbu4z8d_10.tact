struct StrNest {
    txt: String;
    sub: Level2Str;
}

struct Level2Str {
    detail: String;
    flag: Bool;
}

contract NestedStringStorage {
    info: StrNest;

    init() {
        self.info = StrNest{
            txt: "outer",
            sub: Level2Str{
                detail: "inner",
                flag: true,
            },
        };
    }
}