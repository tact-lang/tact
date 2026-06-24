struct Level3 { k: Int; s: String }
struct Level2 { b: Bool; l3: Level3 }
struct Level1 { num: Int; l2: Level2; flag: Bool }

contract MultiLevel {
    state: Level1;

    init() {
        self.state = Level1{
            num: 42,
            l2: Level2{
                b: false,
                l3: Level3{
                    k: -1,
                    s: "nested"
                }
            },
            flag: true
        };
    }
}
