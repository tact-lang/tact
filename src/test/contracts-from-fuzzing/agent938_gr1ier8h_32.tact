struct MixTypes {
    a: Int;
    b: Bool;
    c: String;
}

struct Wrap {
    f1: MixTypes;
    f2: MixTypes?;
}

contract WrapMixOpt {
    w: Wrap;

    init() {
        self.w = Wrap{
            f1: MixTypes{a:1,b:true,c:"x"},
            f2: null,
        };
    }
}
