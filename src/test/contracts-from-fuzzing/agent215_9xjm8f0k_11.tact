struct DeepInner {
    x: Int;
    y: Bool;
}

struct Middle {
    d1: DeepInner;
    d2: DeepInner;
}

struct Top {
    m1: Middle;
    m2: Middle;
}

contract DeeplyNested {
    big: Top = Top{
        m1: Middle{
            d1: DeepInner{x:1,y:true},
            d2: DeepInner{x:2,y:false}
        },
        m2: Middle{
            d1: DeepInner{x:3,y:true},
            d2: DeepInner{x:4,y:false}
        }
    };
}