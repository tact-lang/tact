struct BoolWrap {
    b: Bool;
}

struct StringWrap {
    s: String;
}

contract MultiDiffTypes {
    bw: BoolWrap;
    sw: StringWrap;
    flag: Bool;
    text: String;

    init() {
        self.bw = BoolWrap{b:true};
        self.sw = StringWrap{s:"txt"};
        self.flag = false;
        self.text = "another";
    }
}