struct Level3 { v3: Int; }
struct Level2 { l3: Level3; v2: Bool; }
struct Level1 { l2: Level2; v1: String?; }

contract NestedMixOptionals {
    deep: Level1;

    init() {
        self.deep = Level1{
            l2: Level2{
                l3: Level3{
                    v3: 777
                },
                v2: false
            },
            v1: null
        };
    }
}