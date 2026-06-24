struct Level3 {
    flag: Bool?;
    label: String;
}

struct Level2 {
    data: Level3;
    note: String?;
}

struct Level1 {
    inner: Level2;
}

contract DeepNestedTest {
    nested: Level1;

    init() {
        self.nested = Level1{
            inner: Level2{
                data: Level3{
                    flag: null,
                    label: "deep"
                },
                note: null
            }
        };
    }
}
