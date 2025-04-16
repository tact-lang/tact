struct InnerMost {
    f: Int?;
    text: String;
}

struct InnerMid {
    sub: InnerMost?;
    num: Int;
}

struct Outer {
    mid: InnerMid;
    flag: Bool;
}

contract DeepOptAssign {
    data: Outer;

    init() {
        self.data = Outer{
            mid: InnerMid{
                sub: null,
                num: 42
            },
            flag: true
        };
    }
}