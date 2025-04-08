struct InnerStruct {
    val: Int;
}

struct TopLevel {
    optInner: InnerStruct?;
}

contract OptionalInStructField {
    top: TopLevel = TopLevel{optInner: null};

    init() {
        self.top = TopLevel{optInner: null};
    }
}