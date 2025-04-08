struct InnerMost {
    foo: Int?; 
    bar: String?; 
}

struct Middle {
    innermost: InnerMost; 
    optStr: String?;
}

struct Outer {
    middle: Middle;
    flag: Bool;
}

contract VeryDeepNest {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                innermost: InnerMost{ foo: null, bar: null },
                optStr: null,
            },
            flag: false,
        };
    }
}