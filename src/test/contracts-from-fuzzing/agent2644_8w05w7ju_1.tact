struct DeepNested {
    inner: InnerMost;
}

struct InnerMost {
    flag: Bool;
    count: Int?;
}

contract TestContract {
    data: DeepNested;
    
    init() {
        self.data = DeepNested{ inner: InnerMost{ flag: true, count: null } };
    }
}