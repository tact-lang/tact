contract TestContract {
    a: Int as uint8 = 1; 
    b: Int as int32 = -50; 
    c: Int as coins = ton("1");
    init() {
        self.a = 2;
        self.b = -100;
        self.c = ton("2");
    }
}