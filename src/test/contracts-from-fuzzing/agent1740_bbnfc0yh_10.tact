struct InnerMost {
    flag: Bool;
    num: Int;
    txt: String;
}

struct MiddleOptional {
    x: Int?;
    inner: InnerMost?;
}

struct OuterOptional {
    mid: MiddleOptional?;
    val: Int;
}

contract OptionPointers {
    storage: OuterOptional = OuterOptional{
        mid: null,
        val: 100
    };

    init() {
        self.storage = OuterOptional{
            mid: MiddleOptional{
                x: 1,
                inner: InnerMost{flag:true, num:7, txt:"ok"}
            },
            val: 200
        };
    }
}