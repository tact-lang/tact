struct Level2 {
    d: Int;
}
struct Level1 {
    c: Level2;
}
struct Base {
    b: Level1;
}

contract Renewed {
    data: Base;
    init() {
        self.data = Base{b: Level1{c: Level2{d:42}}};
    }
}