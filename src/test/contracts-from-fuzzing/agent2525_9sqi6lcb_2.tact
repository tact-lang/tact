struct DeepNested {
    n2: NestedStruct;
    message: String;
}

struct NestedStruct {
    n1: SimpleStruct;
}

struct SimpleStruct {
    number: Int;
    flag: Bool;
}

contract TestContract {
    val: DeepNested;

    init() {
        self.val = DeepNested{
            n2: NestedStruct{
                n1: SimpleStruct{number: 123, flag: false}
            },
            message: "hello"
        };
    }
}