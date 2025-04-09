struct InnerTrue {
    flag: Bool = true;
}

struct Middle {
    i: Int?;
    inner: InnerTrue;
}

contract CombineDefaultsNested {
    m: Middle;
    s: String = "hello";

    init() {
        self.m = Middle{
            i: null,
            inner: InnerTrue{}
        };
    }
}