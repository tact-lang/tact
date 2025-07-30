struct ManyOptionalNested {
    a: Int?;
    b: Level2?;
}

struct Level2 {
    c: Int?;
    d: Level3?;
}

struct Level3 {
    e: Int?;
    flag: Bool;
}

contract OptionalDeepNestTest {
    info: ManyOptionalNested;

    init() {
        self.info = ManyOptionalNested{
            a: null,
            b: null
        };
    }
}