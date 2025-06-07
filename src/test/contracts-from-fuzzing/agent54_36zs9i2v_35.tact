struct TwoDeep {
    a: Int;
    b: Int;
}

struct TopWrap {
    x: TwoDeep;
    y: TwoDeep;
}

contract StructTwice {
    data: TopWrap;

    init() {
        self.data = TopWrap{
            x: TwoDeep{a:5,b:6},
            y: TwoDeep{a:7,b:8}
        };
    }
}