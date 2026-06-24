struct Level3 {
    foo: Int;
    bar: Bool?;
}

struct Level2 {
    inner: Level3;
    label: String;
}

struct Level1 {
    part: Level2;
    descr: String;
}

contract DeepOptional {
    nested: Level1?;

    init() {
        self.nested = Level1{
            part: Level2{
                inner: Level3{foo: 77, bar: null},
                label: "abc"
            },
            descr: "test"
        };
    }
}