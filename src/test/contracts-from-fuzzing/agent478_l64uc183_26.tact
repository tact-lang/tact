struct ManyLevels {
    a: Int;
    b: Bool;
    c: InnerOne;
}

struct InnerOne {
    d: Bool?;
    e: InnerTwo?;
}

struct InnerTwo {
    f: Int;
    g: Bool;
    h: String?;
}

contract Deep {
    val: ManyLevels = ManyLevels{
        a:1,b:true,c: InnerOne{
            d:null,
            e: null
        }
    };
}