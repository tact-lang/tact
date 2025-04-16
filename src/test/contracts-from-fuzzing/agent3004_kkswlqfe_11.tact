struct InnerMost {
    flag: Bool;
    num: Int;
}

struct Mid {
    a: Int;
    im: InnerMost;
}

struct Out {
    mid: Mid;
    txt: String;
}

contract NestedMultiTypes {
    val: Out;

    init() {
        self.val = Out{
            mid: Mid{
                a: 5,
                im: InnerMost{ flag:true, num:42 }
            },
            txt:"hello"
        };
    }
}