struct SInner {
    x: Int;
    y: Bool;
}

struct SMid {
    inner1: SInner;
    inner2: SInner;
}

struct SOuter {
    mid1: SMid;
    mid2: SMid;
}

contract ManyNestedStructs {
    val: SOuter = SOuter{
        mid1: SMid{inner1: SInner{x:1,y:true}, inner2: SInner{x:2,y:false}},
        mid2: SMid{inner1: SInner{x:3,y:true}, inner2: SInner{x:4,y:false}}
    };
}