contract MultiplePersistenceTypes {
    num: Int;
    txt: String;
    flg: Bool;
    optNum: Int?;
    optTxt: String?;
    optFlg: Bool?;

    init() {
        self.num = 7;
        self.txt = "hi";
        self.flg = true;
        self.optNum = null;
        self.optTxt = null;
        self.optFlg = null;
    }
}