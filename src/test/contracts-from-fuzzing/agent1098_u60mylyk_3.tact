struct DeepNested3 {
    value: Int;
}

struct DeepNested2 {
    inner3: DeepNested3;
    flag: Bool;
}

struct DeepNested1 {
    inner2: DeepNested2;
    text: String;
}

contract DeepStorage {
    nested: DeepNested1;

    init() {
        self.nested = DeepNested1{
            inner2: DeepNested2{
                inner3: DeepNested3{
                    value: 123
                },
                flag: true
            },
            text: "deep"
        };
    }
}
