struct StringNest {
    info: InfoNested;
}

struct InfoNested {
    title: String;
    subtitle: String;
    flag: Bool;
}

contract TestStringNest {
    val: StringNest = StringNest{
        info: InfoNested{
            title: "Hello",
            subtitle: "World",
            flag: true
        }
    };

    init() {
        self.val = StringNest{
            info: InfoNested{
                title: "New",
                subtitle: "Data",
                flag: false
            }
        };
    }
}
