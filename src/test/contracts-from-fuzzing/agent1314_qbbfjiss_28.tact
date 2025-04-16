struct VarSizeInt {
    a: Int as uint3;
    b: Int as uint24;
    c: Int as int12;
}

contract VarIntSizes {
    v: VarSizeInt;

    init() {
        self.v = VarSizeInt{
            a: 3, b:8, c:-4
        };
    }
}