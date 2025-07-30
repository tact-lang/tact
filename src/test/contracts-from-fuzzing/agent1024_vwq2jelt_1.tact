struct DeepNested {
    level: Int;
    child: NestedStruct; 
}

struct NestedStruct {
    flag: Bool;
    value: Int;
}

contract DeepContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            level: 1,
            child: NestedStruct{flag: true, value: 42}
        };
    }
}