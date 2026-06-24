struct Trio {
    x: Int;
    y: Bool;
    z: Int;
}

contract Test30 {
    t1: Trio = Trio{ x:1, y:true, z:2 };
    t2: Trio = Trio{ x:3, y:false, z:4 };
}