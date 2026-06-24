struct Level3 { val: Int }

struct Level2 {
    x: Bool;
    y: Int?;
    nested: Level3;
}

struct Level1 {
    foo: Level2;
    bar: Bool?;
    baz: String;
}

contract DeepStruct {
    s: Level1;

    init() {
        self.s = Level1{
            foo: Level2{
                x: false,
                y: null,
                nested: Level3{ val: 9 }
            },
            bar: true,
            baz: "A"
        };
    }
}