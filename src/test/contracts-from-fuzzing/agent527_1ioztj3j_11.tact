struct BoolIntString {
    flag: Bool;
    num: Int;
    txt: String;
}

contract OrderChange {
    f: BoolIntString;
    init() {
        self.f = BoolIntString{
            flag:true,num:123,txt:"abc",
        };
    }
}