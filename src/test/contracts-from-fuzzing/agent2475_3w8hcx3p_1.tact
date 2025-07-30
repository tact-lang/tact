struct DeepLevel {
    flag: Bool;
    count: Int;
}

struct MiddleLevel {
    inner: DeepLevel;
    note: String;
}

contract DeepNestedContract {
    deep: MiddleLevel;
    
    init() {
        self.deep = MiddleLevel{ inner: DeepLevel{ flag: true, count: 7 }, note: "test" };
    }
}