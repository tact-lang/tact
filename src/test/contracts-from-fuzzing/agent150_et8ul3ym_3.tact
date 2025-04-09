struct Level3 {
    q: Int;
}
struct Level2 {
    p: Level3;
}
struct Level1 {
    o: Level2?;
}

contract DeepNestedOptional {
    state: Level1;

    init() {
        self.state = Level1{
            o: null
        };
    }
}