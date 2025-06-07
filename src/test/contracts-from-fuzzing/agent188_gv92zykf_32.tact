struct Boo {
    b: Bool;
}

struct LevelA {
    boo: Boo;
}

contract NestedBool {
    top: LevelA;
    init() {
        self.top = LevelA{
            boo: Boo{ b: false }
        };
    }
}
