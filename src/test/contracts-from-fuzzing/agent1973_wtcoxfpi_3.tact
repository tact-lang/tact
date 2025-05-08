struct Level1 { val1: Int; val2: Bool; }
struct Level2 { nested: Level1; other: Int; }
struct Level3 { nested2: Level2; str: String; }

contract DeepNested {
    data: Level3;

    init() {
        self.data = Level3{
            nested2: Level2{
                nested: Level1{ val1: 7, val2: true },
                other: 42
            },
            str: "nested"
        };
    }
}
