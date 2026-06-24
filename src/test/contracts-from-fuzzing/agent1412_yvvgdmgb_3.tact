struct InnerMost {
    a: String?;
    b: Int;
}

struct Middle {
    inner: InnerMost?;
    flag: Bool;
}

struct Outer {
    mid: Middle?;
    num: Int;
}

contract DeepOptionalStructs {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{
                inner: InnerMost{ a: null, b: 5 },
                flag: true
            },
            num: 10
        };
    }
}