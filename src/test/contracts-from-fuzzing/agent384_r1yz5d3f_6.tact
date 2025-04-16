struct OptionalDeep {
    one: Level1?;
    label: String;
}

struct Level1 {
    two: Level2;
    note: String;
}

struct Level2 {
    num: Int;
    message: String;
}

contract OptionalNesting {
    s: OptionalDeep;

    init() {
        self.s = OptionalDeep{
            one: null,
            label: "Deep"
        };
    }
}