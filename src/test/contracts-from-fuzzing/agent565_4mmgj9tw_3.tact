struct Level3 { x: Int; y: Bool?; }
struct Level2 { nested: Level3; z: String; }
struct Level1 { nested2: Level2; w: Int; }

contract DeepNest {
    deep: Level1;
    init() {
        self.deep = Level1{
            nested2: Level2{
                nested: Level3{
                    x: 7,
                    y: null,
                },
                z: "abc",
            },
            w: 10,
        };
    }
}