struct LargeNested {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    str: String = "x";
    inner: InnerStruct;
}

struct InnerStruct {
    f1: Int = 4;
    f2: Bool = true;
    f3: String = "s";
}

contract BigNest {
    val: LargeNested;

    init() {
        self.val = LargeNested{
            a: 10,
            b: 20,
            c: 30,
            str: "z",
            inner: InnerStruct{
                f1: 40,
                f2: false,
                f3: "deep"
            }
        };
    }
}