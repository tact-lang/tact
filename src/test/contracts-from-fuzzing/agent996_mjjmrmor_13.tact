contract TestStorage {
    num: Int as int4;
    flag: Bool;
    opt: Int?;

    init() {
        self.num = 5;
        self.flag = true;
        self.opt = null;
    }
}