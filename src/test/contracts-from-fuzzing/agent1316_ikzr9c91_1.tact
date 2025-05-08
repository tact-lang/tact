struct Deep {
    num: Int;
    flag: Bool;
    nested: NestedStruct;
}

struct NestedStruct {
    text: String;
    option: SimpleStruct?;
}

struct SimpleStruct {
    val: Int;
}

contract DeepTest {
    deep: Deep;

    init() {
        self.deep = Deep{
            num: 1,
            flag: true,
            nested: NestedStruct{
                text: "hi",
                option: SimpleStruct{ val: 42 },
            },
        };
    }
}