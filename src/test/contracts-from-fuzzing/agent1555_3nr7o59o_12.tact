contract Optionalserialization {
    smallOpt: Int? as uint4;
    bigOpt: Int? as int256;

    init() {
        self.smallOpt = 3;
        self.bigOpt = -100;
    }

    receive(){}
}