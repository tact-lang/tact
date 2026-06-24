struct PrimCombo {
    x: Int;
    y: Bool;
    z: String;
}

contract ManyPrimStructs {
    p1: PrimCombo=PrimCombo{x:1,y:true,z:"a"};
    p2: PrimCombo=PrimCombo{x:2,y:false,z:"b"};
}