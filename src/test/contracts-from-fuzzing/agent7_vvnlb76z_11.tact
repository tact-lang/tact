struct Item {
    a: Int;
    b: Bool;
}

contract TestOptionalCompositeGetter {
    items: map<Int, Item>;
    
    init() {
        self.items = emptyMap();
        self.items.set(1, Item{
            a: 123,
            b: false
        });
    }
    
    receive() {}
    
    get fun getItem(key: Int): Item? {
        return self.items.get(key);
    }
}
