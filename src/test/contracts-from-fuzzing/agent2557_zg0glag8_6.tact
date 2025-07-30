struct InnerMost {
    a: Int?;
}

struct Middle {
    b: Bool;
    innermost: InnerMost;
}

struct Outer {
    mid: Middle;
    flag: Bool?;
}

contract TestContract {
    val: Outer;
    init() {
        self.val = Outer{
            mid: Middle{
                b: true,
                innermost: InnerMost{ a: null },
            },
            flag: null
        };
    }
}