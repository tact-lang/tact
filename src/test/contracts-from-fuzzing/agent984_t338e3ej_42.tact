struct IntSizeVariants {
    x: Int as int4;
    y: Int as uint64;
    z: Int as int257;
}

contract VariousWidths {
    v: IntSizeVariants = IntSizeVariants{x:3,y:4,z:5};
}