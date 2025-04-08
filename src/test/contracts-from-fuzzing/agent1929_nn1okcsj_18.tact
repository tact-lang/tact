struct NestedOptionStruct {
    opt: Level1?;
}

struct Level1 {
    opt2: Level2?;
}

struct Level2 {
    val: Int;
}

contract ChainOptional {
    d: NestedOptionStruct;
    init() {
        self.d = NestedOptionStruct{
            opt: Level1{
                opt2: Level2{val: 42}
            }
        };
    }
}