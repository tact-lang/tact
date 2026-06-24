struct Level3 {
    deep: Int;
}

struct Level2 {
    l3: Level3;
    optStr: String?;
}

struct Level1 {
    l2: Level2;
    flag: Bool;
}

contract DeepTest {
    data: Level1;

    init() {
        self.data = Level1{
            l2: Level2{
                l3: Level3{ deep: 77 },
                optStr: null
            },
            flag: true
        };
    }
}
