struct StringNest {
    x: String;
    y: String?;
}

struct Level2 {
    inner: StringNest;
    z: Int;
}

struct Level1 {
    mid: Level2;
    flag: Bool?;
}

contract DeepStrings {
    val: Level1;

    init() {
        self.val = Level1{
            mid: Level2{
                inner: StringNest{
                    x: "foo",
                    y: null,
                },
                z: 42,
            },
            flag: true,
        };
    }
}