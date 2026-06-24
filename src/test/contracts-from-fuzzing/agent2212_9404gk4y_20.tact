struct Level3 {
    val: Int;
}

struct Level2 {
    inner: Level3?;
    optVal: Bool?;
}

struct Level1 {
    nested: Level2;
}

contract Test {
    s: Level1;

    init() {
        self.s = Level1{
            nested: Level2{inner: Level3{val:999}, optVal: null}
        };
    }
}
