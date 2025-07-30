// Contract with interleaved bool optional and non optional
contract BoolMix {
    flag1: Bool;
    opt1: Bool?;
    flag2: Bool;
    opt2: Bool?;

    init() {
        self.flag1 = true;
        self.opt1 = null;
        self.flag2 = false;
        self.opt2 = true;
    }

    receive() {
        if (self.opt2 != null && self.opt2!!) {
            self.flag2 = true;
        }
    }
}