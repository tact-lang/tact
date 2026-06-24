contract ManyFields {
    x: Int;
    y: String;
    z: Int?;
    flag: Bool;
    addr: Address;
    txt: String?;
    big: Int;
    fl: Bool?;

    init() {
        self.x = 10;
        self.y = "abc";
        self.z = null;
        self.flag = false;
        self.addr = myAddress();
        self.txt = null;
        self.big = 123456789;
        self.fl = true;
    }
}