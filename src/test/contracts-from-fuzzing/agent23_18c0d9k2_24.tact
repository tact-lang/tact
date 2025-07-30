contract CoinTypes {
    coinsVal: Int as coins;
    intVal: Int as int257;
    uint8Val: Int as uint8;

    init() {
        self.coinsVal = 1;
        self.intVal = -1;
        self.uint8Val = 255;
    }
}