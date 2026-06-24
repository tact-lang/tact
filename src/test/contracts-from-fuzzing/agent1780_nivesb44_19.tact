struct StringNest {
    val1: String;
    val2: String;
    child: InnerString;
}

struct InnerString {
    msg: String;
}

contract StringsNested {
    stuff: StringNest;

    init() {
        self.stuff = StringNest{
            val1:"one",
            val2:"two",
            child: InnerString{ msg:"child" }
        };
    }
}