struct Base {
    x: Int;
    y: Bool;
}

struct MidA {
    inner: Base;
}

struct MidB {
    val: Base;
}

contract NestedTwoBranches {
    a: MidA = MidA{inner: Base{x:1,y:true}};
    b: MidB = MidB{val: Base{x:2,y:false}};
}