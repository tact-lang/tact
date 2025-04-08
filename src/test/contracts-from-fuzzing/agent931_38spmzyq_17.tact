struct Level2 {
    x: Int;
    y: String;
}

struct Level1 {
    a: Level2;
    b: Int;
}

contract NestedWithString {
    n: Level1;
    
    init() {
        self.n = Level1{ a: Level2{ x:10, y:"str" }, b:99 };
    }
}