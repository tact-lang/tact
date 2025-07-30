struct Level3 {
    a: Int;
    b: Bool;
}

struct Level2 {
    optL3: Level3?;
    text: String;
}

struct Level1 {
    optL2: Level2?;
    num: Int;
}

contract OptionalDeepNested {
    val: Level1;

    init() {
        self.val = Level1{
            optL2: Level2{
                optL3: null,
                text: "deep",
            },
            num: 99,
        };
    }
}
