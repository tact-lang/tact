struct Item { key: Int; val: Int; }

contract LargeMap {
    storage: map<Int, Item>;
    init() {
        let m: map<Int, Item> = emptyMap();
        m.set(1, Item{ key: 1, val: 11 });
        m.set(2, Item{ key: 2, val: 22 });
        self.storage = m;
    }
    receive() {}
}