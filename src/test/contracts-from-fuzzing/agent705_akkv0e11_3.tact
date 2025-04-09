struct Level1 {
    field1: Int;
    optBool: Bool?;
    level2: Level2;
}

struct Level2 {
    innerInt: Int;
    innerString: String;
}

contract DeepNestedTest {
    data: Level1;

    init() {
        self.data = Level1{
            field1: 5,
            optBool: null,
            level2: Level2{innerInt: 4, innerString: "x"}
        };
    }
}