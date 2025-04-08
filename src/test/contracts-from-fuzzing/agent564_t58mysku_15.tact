// Sequential bools and ints to test packing order
contract MixPacked {
    flag1: Bool;
    count: Int;
    flag2: Bool;
    total: Int;
    flag3: Bool;

    init() {
        self.flag1 = true;
        self.count = 5;
        self.flag2 = false;
        self.total = 10;
        self.flag3 = true;
    }

    receive() {
        self.count +=1;
    }
}