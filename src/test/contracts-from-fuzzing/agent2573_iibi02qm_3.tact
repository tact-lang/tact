contract ManyWidths {
    smallI: Int as int8;
    smallU: Int as uint8;
    medI: Int as int32;
    medU: Int as uint32;
    bigI: Int as int256;
    bigU: Int as uint256;

    init() {
        self.smallI = -5;
        self.smallU = 5;
        self.medI = -1000;
        self.medU = 1000;
        self.bigI = -1;
        self.bigU = 1;
    }
}