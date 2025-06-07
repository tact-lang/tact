struct SubNested {
    val: Int;
}

struct Middle {
    a: Int;
    b: SubNested;
}

struct Top {
    flag: Bool;
    mid: Middle;
    optStr: String?;
}

contract ComplexNested {
    data: Top;

    init() {
        self.data = Top{
            flag: true,
            mid: Middle{
                a: 5,
                b: SubNested{val: 7}
            },
            optStr: null
        };
    }
}