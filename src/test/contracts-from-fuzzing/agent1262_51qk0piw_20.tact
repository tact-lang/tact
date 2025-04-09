struct NestedPrimitives {
    x: Int;
    y: Bool;
    z: String;
}

struct MoreNested {
    np: NestedPrimitives;
    flag: Bool;
}

contract WithMoreNested {
    f: MoreNested = MoreNested{
        np: NestedPrimitives{x:1,y:true,z:"hi"},
        flag: false
    };
}