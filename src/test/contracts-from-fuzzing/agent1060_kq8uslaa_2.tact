struct Level3 {
    a: Int;
    b: Bool;
}

struct Level2 {
    lvl3: Level3;
    flag: Bool;
}

struct Level1 {
    lvl2: Level2;
    count: Int;
}

contract DeepNestTest {
    deepData: Level1;

    init() {
        self.deepData = Level1{
            lvl2: Level2{
                lvl3: Level3{
                    a: 123,
                    b: true
                },
                flag: false
            },
            count: 42
        };
    }
}