struct NestedMap {
    dict: map<Int, Int>;
}

contract Test {
    storage: NestedMap?;
    init() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 20);
        self.storage = NestedMap{ dict: m };
    }
}