struct ContainStr {
    s: String;
}

struct HasStruct {
    inside: ContainStr;
    comment: String;
}

contract StringNest {
    big: HasStruct;

    init() {
        self.big = HasStruct{
            inside: ContainStr{s: "abc"},
            comment: "def"
        };
    }
}