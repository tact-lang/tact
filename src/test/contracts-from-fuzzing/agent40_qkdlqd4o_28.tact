contract LongInit {
    counter: Int;
    flag1: Bool;
    msg: String;
    opt: Int?;

    init() {
        let i = 100;
        let f = true;
        let s = "hello world";
        self.counter = i;
        self.flag1 = f;
        self.msg = s;
        self.opt = null;
    }
}