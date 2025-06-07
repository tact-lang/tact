struct Deep {
    a: Int;
    b: Bool?;
    c: Int?;
    d: Bool;
}

struct Middle {
    deep: Deep;
}

struct Outer {
    middle: Middle;
}

contract ComplexNest {
    outer: Outer;

    init() {
        self.outer = Outer{
            middle: Middle{
                deep: Deep{a:1,b:true,c:3,d:false}
            }
        };
    }
}