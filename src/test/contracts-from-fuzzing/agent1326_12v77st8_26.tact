struct MixNest {
    i: Int;
    b: Bool;
    s: String;
    o: InnerBox?;
}

struct InnerBox {
    val: Int;
    txt: String?;
}

contract NestedMixOptional {
    state: MixNest;
    init() {
        self.state = MixNest{
            i: 7,
            b: false,
            s: "x",
            o: InnerBox{val: 9, txt: null},
        };
    }
}