struct StrDeep {
    title: String;
    nested: StrNested;
}

struct StrNested {
    subtitle: String;
    more: StrMore;
}

struct StrMore {
    info: String;
    flag: Bool;
}

contract TestStrDeep {
    val: StrDeep = StrDeep{
        title: "Top",
        nested: StrNested{
            subtitle: "Mid",
            more: StrMore{
                info: "Low",
                flag: true
            }
        }
    };

    init() {
        self.val.nested.more.flag = false;
    }
}
