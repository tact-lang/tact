struct Level2 {
    innerField: Int;
    optionalBool: Bool?;
}

struct Level1 {
    nestedStruct: Level2;
    optStr: String?;
}

contract DeepNestedTest {
    data: Level1;

    init() {
        self.data = Level1{
            nestedStruct: Level2{
                innerField: 5,
                optionalBool: null
            },
            optStr: null
        };
    }
}