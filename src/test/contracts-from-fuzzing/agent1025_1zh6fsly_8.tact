struct InnerDeepest {
    value: Int;
}

struct InnerMid {
    child: InnerDeepest;
}

struct OuterDeep {
    nested: InnerMid;
}

contract VeryDeep {
    deep: OuterDeep;

    init() {
        self.deep = OuterDeep{
            nested: InnerMid{
                child: InnerDeepest{ value: 42 }
            }
        };
    }
}
