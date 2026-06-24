struct Level1 { x: Int; y: Bool; }
struct Level2 { nested: Level1; flag: Bool; }
struct Level3 { deep: Level2; text: String; }

contract DeepMultiType {
    v: Level3;

    init() {
        self.v = Level3{
            deep: Level2{
                nested: Level1{ x: 5, y: true },
                flag: false
            },
            text: "abc"
        };
    }
}
