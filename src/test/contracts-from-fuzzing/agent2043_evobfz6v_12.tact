struct Compose {
    num: Int;
    txt: String;
    flg: Bool;
    optNum: Int?;
    optStr: String?;
    optFlg: Bool?;
}

contract DifferentTypes {
    storage: Compose;

    init() {
        self.storage = Compose{
            num:1, txt:"abc", flg:true,
            optNum: null, optStr: null, optFlg: null
        };
    }
}
