contract TestContract {
    counter: Int as uint8 = 0;
    bigcounter: Int as uint256 = 1;
    smallneg: Int as int8 = -3;
    bigneg: Int as int257 = -5000000;

    init() {
        self.counter = 10;
        self.bigcounter = 1000000;
        self.smallneg = -2;
        self.bigneg = -9999999;
    }

    receive() {
        let _ = self.smallneg;
    }
}