struct Inner {
    num: Int;
    text: String;
}

struct Mid {
    i1: Inner;
    i2: Inner;
}

struct Out {
    mid: Mid;
    text: String;
}

contract ComplexNested {
    storage: Out;
    init() {
        self.storage = Out{
            mid: Mid{
                i1: Inner{num:1, text:"hello"},
                i2: Inner{num:2, text:"world"}
            },
            text: "outer"
        };
    }
}