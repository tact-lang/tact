struct Level1 {
    a: Int;
    b: Bool?;
    inner: Level2;
}

struct Level2 {
    c: String?;
}

contract TestContract {
    s: Level1;
    init() {
        self.s = Level1{
            a: 1,
            b: null,
            inner: Level2{ c: null }
        };
    }
}