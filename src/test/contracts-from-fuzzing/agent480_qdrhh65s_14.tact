message(0x77) Mmsg { val: Int }

contract ManyOptionals {
    optInt: Int?;
    optStr: String?;
    optMsg: Mmsg?;

    init() {
        self.optInt = 999;
        self.optStr = "opt";
        self.optMsg = Mmsg{val:888};
    }
}