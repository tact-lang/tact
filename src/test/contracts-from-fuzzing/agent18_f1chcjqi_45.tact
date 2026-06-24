struct SerInner {
    a: Int as int32;
    b: Bool?;
}

contract NestedSerialize {
    field: SerInner;
    init() {
        self.field = SerInner{ a:123, b:null };
    }
}