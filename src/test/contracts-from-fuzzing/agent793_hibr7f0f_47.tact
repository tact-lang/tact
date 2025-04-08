contract ShadowPersistent {
    counter: Int = 1;
    counter2: Int = 2;
    
    init() {
        self.counter = 10;
        self.counter2 = 20;
    }
}