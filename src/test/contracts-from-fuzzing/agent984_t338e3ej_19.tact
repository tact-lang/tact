struct BoolInts {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    i1: Int;
    i2: Int;
    i3: Int;
}

contract PackedBits {
    x: BoolInts = BoolInts{
        b1:true, b2:false, b3:true, i1:1, i2:2, i3:3
    };
}