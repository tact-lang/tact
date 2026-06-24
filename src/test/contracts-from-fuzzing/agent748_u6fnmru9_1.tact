struct DeepNested {
    field1: Int;
    nested: SecondLevel;
}

struct SecondLevel {
    opt: ThirdLevel?;
}

struct ThirdLevel {
    s: String;
    flag: Bool;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            field1: 42,
            nested: SecondLevel{
                opt: ThirdLevel{
                    s: "Hello",
                    flag: true
                }
            }
        };
    }
}