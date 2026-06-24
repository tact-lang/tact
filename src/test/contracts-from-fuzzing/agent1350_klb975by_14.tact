struct InnerMost {
    x: Int;
}

struct Middle {
    optional: InnerMost?;
    flag: Bool;
}

struct Top {
    nested: Middle;
    s: String;
}

contract DeepOptionalInsideNestedStruct {
    data: Top;

    init() {
        self.data = Top{
            nested: Middle{ optional:null, flag:true },
            s: "ok"
        };
    }
}