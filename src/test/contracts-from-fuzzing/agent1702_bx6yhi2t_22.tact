struct Compact {
    small1: Int as uint4;
    small2: Int as uint4;
    small3: Int as uint4;
    small4: Int as uint4;
    small5: Int as uint4;
}

contract ManySmallSerialized {
    compact: Compact;
    bitFlag: Bool;

    init() {
        self.compact = Compact{small1:1,small2:2,small3:3,small4:4,small5:5};
        self.bitFlag = true;
    }
}
