struct InnerMost {
    val: Int?;
}

struct InnerLevel {
    im: InnerMost;
}

contract OptionalInsideStruct {
    s: InnerLevel;

    init() {
        self.s = InnerLevel{
            im: InnerMost{ val: null }
        };
    }
}