struct DeeplyNested {
    a: Level1;
}
struct Level1 {
    b: Level2;
}
struct Level2 {
    c: Level3;
}
struct Level3 {
    d: Level4;
}
struct Level4 {
    val: Int;
}

contract TestDeepNesting {
    top: DeeplyNested;
    init() {
        self.top = DeeplyNested{
            a: Level1{ b: Level2{ c: Level3{ d: Level4{ val: 999 } } } }
        };
    }
}