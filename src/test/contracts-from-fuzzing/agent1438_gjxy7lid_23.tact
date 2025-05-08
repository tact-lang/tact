struct LevelC {
    c: Int? = null;
}

struct LevelB {
    b: LevelC? = null;
}

struct LevelA {
    a: LevelB? = null;
}

contract DeepOptionalChain {
    foo: LevelA? = null;

    init() {
        self.foo = null;
    }
}