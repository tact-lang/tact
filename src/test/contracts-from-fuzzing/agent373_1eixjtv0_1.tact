struct InnerMost {
    flag: Bool;
    note: String;
}

struct Inner {
    value: Int?;
    nested: InnerMost;
}

contract DeepNested {
    record: Inner;
    
    init() {
        self.record = Inner{
            value: 42,
            nested: InnerMost{
                flag: true,
                note: "hello"
            }
        };
    }
}