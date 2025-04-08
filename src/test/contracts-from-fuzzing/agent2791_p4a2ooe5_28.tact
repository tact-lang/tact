struct LevelTwo {
    val: Int?;
}

contract ManyNullableStructs {
    one: LevelTwo?;
    two: LevelTwo?;
    three: LevelTwo?;
    four: LevelTwo?;

    init() {
        self.one = null;
        self.two = null;
        self.three = null;
        self.four = null;
    }
}
