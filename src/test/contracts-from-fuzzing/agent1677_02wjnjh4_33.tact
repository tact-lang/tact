struct ComposeMany {
    one: Int;
    two: InnerTwo;
    three: Int?;
    four: String;
    five: InnerThree?;
}

struct InnerTwo {
    first: Bool;
    second: String?;
}

struct InnerThree {
    flag: Bool?;
    label: String;
}

contract TestComposeMany {
    val: ComposeMany = ComposeMany{
        one:1,
        two: InnerTwo{first:true,second:null},
        three:null,
        four:"text",
        five:null
    };

    init() {
        self.val.five=InnerThree{flag:true,label:"hi"};
    }
}
