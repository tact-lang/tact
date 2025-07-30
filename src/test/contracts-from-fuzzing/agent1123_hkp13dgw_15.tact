struct InnerMost {
    val: Int;
}

struct InnerOpt {
    maybe: InnerMost?;
    text: String?;
}

struct Middle {
    nest: InnerOpt;
    flag: Bool;
}

contract DeepOptionals {
    content: Middle;

    init() {
        self.content = Middle{
            nest: InnerOpt{maybe:null, text:null},
            flag: true,
        };
    }
}