struct TextNest {
    inner1: String;
    inner2: String?;
}

struct OuterContain {
    base: TextNest;
    optBase: TextNest?;
}

contract OptionalText {
    val: OuterContain;

    init() {
        self.val = OuterContain{
            base: TextNest{inner1:"abc", inner2:null},
            optBase: null,
        };
    }
}