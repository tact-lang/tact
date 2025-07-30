struct DeepNested {
    sub: SubNested;
}

struct SubNested {
    value: Int;
}

contract TestContract {
    data: DeepNested;
    
    init() {
        self.data = DeepNested{
            sub: SubNested{
                value: 42
            }
        };
    }
}