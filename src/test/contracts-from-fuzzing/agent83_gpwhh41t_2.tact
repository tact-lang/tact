struct Level1 { val: Int; }
struct Level2 { nested: Level1; extra: Int; }
struct Level3 { nested: Level2; flag: Bool; }
struct Level4 { nested: Level3; text: String; }

contract DeepNested {
    data: Level4;
    init() {
        self.data = Level4{
            nested: Level3{
                nested: Level2{
                    nested: Level1{
                        val: 1
                    },
                    extra: 2
                },
                flag: true
            },
            text: "hi"
        };
    }
}
