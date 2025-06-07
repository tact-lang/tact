struct Level3 {
    f: Int?;
}
struct Level2 {
    v: Level3?;
}
struct Level1 {
    e: Level2?;
}

contract OptionalDeep {
    s: Level1?;

    init() {
        self.s = Level1{
            e: Level2{
                v: Level3{
                    f: null
                }
            }
        };
    }
}
