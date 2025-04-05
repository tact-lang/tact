contract TestForEachStorage {
    m: map<Int, Int>;
    
    init() {
        self.m = emptyMap();
        self.m.set(1, 10);
        self.m.set(2, 20);
    }
    
    receive() {
       let sum: Int = 0;
       foreach (k, v in self.m) {
           sum = sum + v;
       }
       dump(sum); // expecting 30
    }
}
