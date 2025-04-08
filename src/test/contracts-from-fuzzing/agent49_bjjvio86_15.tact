struct OptionalDeep {
    opt: Level1?;
}

struct Level1 {
    l2: Level2;
}

struct Level2 {
    val: Int;
}

contract DeepOptional {
    d: OptionalDeep;

    init() {
        self.d = OptionalDeep{
            opt: null
        };
    }
}
