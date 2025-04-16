struct Level1 {
    a: Int?;
}
struct Level2 {
    b: Level1?;
}
struct Level3 {
    c: Level2?;
}

contract DeepOptional {
    deep: Level3;

    init() {
        self.deep = Level3{
            c: Level2{
                b: Level1{ a: 42 }
            }
        };
    }
}