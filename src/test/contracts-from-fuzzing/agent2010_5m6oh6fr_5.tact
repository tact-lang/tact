struct Deep {
    x: Int;
    y: Bool;
    str: String;
}

struct Mid {
    deep: Deep;
    num: Int;
}

struct Outer {
    mid1: Mid;
    mid2: Mid;
    flag: Bool;
}

contract ManyNestedFields {
    s: Outer;

    init() {
        self.s = Outer{
            mid1: Mid{
                deep: Deep{ x:1, y:true, str:"A" },
                num: 100,
            },
            mid2: Mid{
                deep: Deep{ x:2, y:false, str:"B" },
                num: 200,
            },
            flag: false,
        };
    }
}