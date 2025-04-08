struct Level1 { f: Int; }
struct Level2 { l1: Level1; f: Bool; }
struct Level3 { l2: Level2; f: String; }
struct Root { l3: Level3; opt: Int?; }

contract LayersTest {
    data: Root = Root{
        l3: Level3{
            l2: Level2{ l1: Level1{ f: 7 }, f: true },
            f: "abc"
        },
        opt: null
    };

    init() {
        self.data = Root{
            l3: Level3{
                l2: Level2{ l1: Level1{ f: 1 }, f: false },
                f: "xyz"
            },
            opt: 42
        };
    }
}
