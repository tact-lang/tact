struct DeepNested1 {
    val1: Int;
    opt1: Bool?;
}

struct DeepNested2 {
    nested: DeepNested1;
    text: String;
}

struct DeepNested3 {
    nested2: DeepNested2;
    flag: Bool;
}

contract DeepTest {
    data: DeepNested3;

    init() {
        self.data = DeepNested3{
            nested2: DeepNested2{
                nested: DeepNested1{val1: 1, opt1: null},
                text: "abc",
            },
            flag: true,
        };
    }
}