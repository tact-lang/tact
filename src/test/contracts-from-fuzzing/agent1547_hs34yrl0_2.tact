struct DeepNested {
    level1: Int;
    nested2: Nested2;
}

struct Nested2 {
    level2: Bool;
    nested3: Nested3;
}

struct Nested3 {
    level3: String;
    finalVal: Int;
}

contract DeepTest {
    payload: DeepNested;

    init() {
        self.payload = DeepNested{
            level1: 1,
            nested2: Nested2{
                level2: true,
                nested3: Nested3{
                    level3: "hello",
                    finalVal: 999,
                },
            },
        };
    }
}