struct InnerDeep {
    value: Int;
}

struct Middle {
    inner: InnerDeep;
}

struct OuterDeep {
    middle: Middle;
}

contract DeepStruct {
    data: OuterDeep;

    init() {
        self.data = OuterDeep{
            middle: Middle{ inner: InnerDeep{ value: 99 } }
        };
    }
}