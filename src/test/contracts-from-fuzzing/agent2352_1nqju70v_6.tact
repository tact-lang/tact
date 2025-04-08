struct Level3 { val3: Int; extra: String; }
struct Level2 { val2: Bool; lvl3: Level3; }
struct Level1 { val1: Int; lvl2: Level2; }

contract DeepNested {
    data: Level1;

    init() {
        self.data = Level1{
            val1: 5,
            lvl2: Level2{
                val2: true,
                lvl3: Level3{
                    val3: 9,
                    extra: "hi"
                }
            }
        };
    }
}