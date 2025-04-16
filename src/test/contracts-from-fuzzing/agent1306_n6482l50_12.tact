struct Level3 { q: Int?; w: Bool; }
struct Level2 { lv3: Level3; flag2: Bool; }
struct Level1 { lv2: Level2; num: Int; }

contract TestContract {
    lv1: Level1;

    init() {
        self.lv1 = Level1 {
            lv2: Level2 {
                lv3: Level3 {
                    q: null,
                    w: true,
                },
                flag2: false,
            },
            num: 12345,
        };
    }
}