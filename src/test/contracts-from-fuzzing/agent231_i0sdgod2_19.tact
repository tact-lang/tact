// test deep optional wrapping in nested structs
struct Level3 {
    i: Int?;
}
struct Level2 {
    l3: Level3?;
}
struct Level1 {
    l2: Level2?;
}

contract DeeplyOptional {
    root: Level1;

    init() {
        self.root = Level1{
            l2: Level2{
                l3: Level3{ i: null }
            }
        };
    }
}