struct Level3 {
    leaf: Int = 3;
}
struct Level2 {
    mid: Level3;
}
struct Level1 {
    root: Level2;
}

contract DeepNested {
    state: Level1;

    init() {
        self.state = Level1{
            root: Level2{
                mid: Level3{
                    leaf: 999
                }
            }
        };
    }
}