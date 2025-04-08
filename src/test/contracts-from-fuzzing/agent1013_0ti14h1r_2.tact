struct Level3 { n: Int; opt: String?; }
struct Level2 { l3: Level3; flag: Bool; name: String; }
struct Level1 { l2: Level2; num: Int; }

contract DeepNested {
    storage: Level1;

    init() {
        self.storage = Level1{
            l2: Level2{
                l3: Level3{n: 5, opt: null},
                flag: true,
                name: "x"
            },
            num: 42
        };
    }
}
