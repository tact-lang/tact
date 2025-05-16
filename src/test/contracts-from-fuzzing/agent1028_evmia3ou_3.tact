struct Level2 {
    q: Int?;
}

struct Level1 {
    l2: Level2?;
    s: String;
}

contract DeepNestedOptionStruct {
    data: Level1?;

    init() {
        self.data = Level1{
            l2: null,
            s: "abc",
        };
    }
}
