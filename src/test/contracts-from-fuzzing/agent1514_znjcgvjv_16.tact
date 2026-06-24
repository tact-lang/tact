struct MidNested {
    a: Int;
    opt: String?;
}

struct TopNested {
    b: Bool;
    mid: MidNested;
}

contract OptionalInsideNested {
    data: TopNested;

    init() {
        self.data = TopNested{
            b:false,
            mid: MidNested{ a:1, opt:null }
        };
    }
}