struct Level4 { v4: Int; }
struct Level3 { nested4: Level4; v3: Int; }
struct Level2 { nested3: Level3; v2: Int; }
struct Level1 { nested2: Level2; v1: Int; }

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            nested2: Level2{
                nested3: Level3{
                    nested4: Level4{
                        v4: 4,
                    },
                    v3: 3,
                },
                v2: 2,
            },
            v1: 1,
        };
    }
}