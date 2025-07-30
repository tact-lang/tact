// test nested struct with empty string defaults and optional string
struct Small {
    txt: String = "";
    maybe: String?;
}

struct HasSmall {
    one: Small;
    opt: Small?;
}

contract EmptyStrOpt {
    item: HasSmall;
    init() {
        self.item = HasSmall{
            one: Small{txt:"", maybe:null},
            opt: null
        };
    }
}
