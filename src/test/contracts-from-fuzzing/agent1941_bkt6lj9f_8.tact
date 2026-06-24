contract TestContract {
    big1: Int as int257;
    big2: Int as int256;
    big3: Int as uint256;

    small1: Int as uint8;
    small2: Int as int4;

    optInt: Int?;
    optBool: Bool?;
    txt: String;
    fl: Bool;

    init() {
        self.big1 = 0;
        self.big2 = 0;
        self.big3 = 0;
        self.small1 = 0;
        self.small2 = 0;
        self.optInt = null;
        self.optBool = false;
        self.txt = "hello";
        self.fl = true;
    }
}