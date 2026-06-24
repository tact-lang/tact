struct NestedLevel3 {
    val3a: Int;
    val3b: Bool?;
}

struct NestedLevel2 {
    val2a: NestedLevel3;
    val2b: String;
}

struct NestedLevel1 {
    val1a: NestedLevel2;
    val1b: Int?;
}

contract DeepNestedTest {
    deepValue: NestedLevel1;

    init() {
        self.deepValue = NestedLevel1{
            val1a: NestedLevel2{
                val2a: NestedLevel3{
                    val3a: 5,
                    val3b: true,
                },
                val2b: "test",
            },
            val1b: null,
        };
    }
}