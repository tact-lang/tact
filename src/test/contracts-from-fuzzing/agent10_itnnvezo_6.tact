contract Test3 {
    m: map<Int, Int>;
    
    init() {
        self.m = emptyMap();
        self.m.set(1, 100);
    }
    
    get fun getValue(key: Int): Int? {
         return self.m.get(key);
    }
    
    receive() {}
}
