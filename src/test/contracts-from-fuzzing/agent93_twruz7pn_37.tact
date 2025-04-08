struct Level2 {
    label: String?;
    code: Int;
}

struct Level1 {
    nested: Level2?;
    flag: Bool;
}

contract MultiInnerOptionals {
    info: Level1?;

    init() {
        self.info = Level1{
            nested: Level2{
                label: null,
                code: 101,
            },
            flag: true,
        };
    }
}