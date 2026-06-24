struct LowBit {
    flag: Int as uint1;
}

contract TestContract {
    data: LowBit;

    init() {
        self.data = LowBit{ flag: 1 };
    }

    receive() {
        dump(self.data.flag);
    }
}