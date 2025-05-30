struct Level3 {
    z: Int;
}

struct Level2 {
    nested3: Level3;
    flag: Bool;
}

struct Level1 {
    nested2: Level2;
}

contract TestStorage {
    data: Level1;

    init() {
        self.data = Level1{
            nested2: Level2{
                nested3: Level3{
                    z: 10,
                },
                flag: true,
            },
        };
    }
}