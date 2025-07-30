struct Level1 {
    a: Int = 1;
}
struct Level2 {
    b: Level1;
}
struct Level3 {
    c: Level2;
}

contract MixedDefaultNested {
    data: Level3;
    init() {
        self.data = Level3{
            c: Level2{
                b: Level1{},
            },
        };
    }
}