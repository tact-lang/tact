struct Level3 {
    a: Int;
    b: Bool;
}
struct Level2 {
    x: Bool;
    y: Level3;
}
struct Level1 {
    p: Int;
    q: Level2;
}
contract MultiNesting {
    data: Level1;
    init() {
        self.data = Level1{
            p: 5,
            q: Level2{
                x: false,
                y: Level3{
                    a: 42,
                    b: true
                }
            }
        };
    }
}