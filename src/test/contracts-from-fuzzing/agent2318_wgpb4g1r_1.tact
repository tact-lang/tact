struct DeepNested {
    inner: InnerLevel;
}

struct InnerLevel {
    level: NestedLevel;
}

struct NestedLevel {
    flag: Bool;
    note: String;
}

contract TestContract {
    val: DeepNested = DeepNested{ inner: InnerLevel{ level: NestedLevel{ flag: true, note: "deep" } } };
    
    init() {
        self.val = DeepNested{ inner: InnerLevel{ level: NestedLevel{ flag: false, note: "changed" } } };
    }
}
