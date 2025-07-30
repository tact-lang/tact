contract TonCoinsTypes {
    coins1: Int as coins;
    coins2: Int as coins;
    
    init() {
        self.coins1 = ton("1");
        self.coins2 = 1000000000;
    }
}