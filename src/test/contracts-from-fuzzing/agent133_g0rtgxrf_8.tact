struct InnerMost {
    u: Int;
    v: String;
    w: Bool;
}

struct Middle {
    iopt: InnerMost?;
    arr: InnerMost;    
}

struct Outer {
    mid: Middle;
    midopt: Middle?;
    flag: Bool;
}

contract DeeplyNested {
    payload: Outer;

    init() {
        self.payload = Outer{
            mid: Middle{
                iopt: null,
                arr: InnerMost{u: 5, v: "ok", w: false},
            },
            midopt: null,
            flag: true,
        };
    }
}
