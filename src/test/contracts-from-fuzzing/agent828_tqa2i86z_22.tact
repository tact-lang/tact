struct Cfg {
    num: Int = 100;
    txt: String = "def";
    enable: Bool;
}

contract TestContract {
    foo: Int = 1;
    data: Cfg = Cfg{ enable: true };
    flag: Bool;

    init() {
        self.flag = false;
    }
}