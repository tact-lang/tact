message(0xDEAD) InnerMsg { foo: Int; }

struct Level3 { m: InnerMsg?; }
struct Level2 { l3: Level3?; }
struct Level1 { l2: Level2?; }

contract DeepNestedOptionalMsg {
    obj: Level1;

    init() {
        self.obj = Level1{ l2: null };
    }
}