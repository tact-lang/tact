// test various nested structs with optionals
struct Level3 {
    x: Int?;
}
struct Level2 {
    y: Level3?;
}
struct Level1 {
    z: Level2?;
}

contract Test {
    root: Level1;

    init() {
        self.root = Level1{
            z: Level2{
                y: Level3{
                    x: null
                }
            }
        };
    }
}