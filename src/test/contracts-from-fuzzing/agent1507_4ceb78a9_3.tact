struct Level3 {
    value: String;
}

struct Level2 {
    child: Level3;
    opt: Bool?;
}

struct Level1 {
    nested: Level2;
    count: Int;
}

contract DeepNestedContract {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{
                child: Level3{
                    value: "deep"
                },
                opt: null
            },
            count: 42
        };
    }
}