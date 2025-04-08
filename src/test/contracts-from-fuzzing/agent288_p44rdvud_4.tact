struct Level3 {
    x: Int?;
    y: Bool;
}

struct Level2 {
    innerOpt: Level3?;
    z: Int;
}

struct Level1 {
    nested: Level2;
    flag: Bool;
}

contract DeepNested {
    data: Level1 = Level1{
        nested: Level2{
            innerOpt: null,
            z: 1
        },
        flag: false
    };

    init() {
        self.data = Level1{
            nested: Level2{
                innerOpt: Level3{
                    x: 42,
                    y: true
                },
                z: 10
            },
            flag: true
        };
    }
}