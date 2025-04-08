struct Level3 {
    val3a: Int?;
    val3b: Bool?;
}

struct Level2 {
    val2a: Level3?;
    val2b: String?;
}

struct Level1 {
    val1a: Level2?;
    val1b: Address?;
}

contract DeepNullable {
    nest: Level1?;

    init() {
        self.nest = Level1{
            val1a: null,
            val1b: null,
        };
    }
}