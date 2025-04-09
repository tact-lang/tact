struct Level3 { a: Int; b: Bool; c: String; }

struct Level2 {
    nested: Level3;
    optNested: Level3?;
    flag: Bool;
}

struct Level1 {
    nested2: Level2;
    text: String;
    optionalInt: Int?;
}

contract TestContract {
    deepField: Level1;

    init() {
        self.deepField = Level1{
            nested2: Level2{
                nested: Level3{ a: 1, b: false, c: "c" },
                optNested: null,
                flag: true
            },
            text: "hello",
            optionalInt: null
        };
    }
}
