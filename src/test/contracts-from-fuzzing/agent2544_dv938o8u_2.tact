struct DeepNested {
    level2: Nested2;
}

struct Nested2 {
    level3: Nested3;
}

struct Nested3 {
    num: Int;
    flag: Bool;
    text: String;
}

contract DeepTest {
    deepField: DeepNested;
    init() {
        self.deepField = DeepNested{
            level2: Nested2{
                level3: Nested3{
                    num: 123,
                    flag: true,
                    text: "test"
                }
            }
        };
    }
}