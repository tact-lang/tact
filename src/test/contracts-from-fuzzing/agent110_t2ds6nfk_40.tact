struct Pack {
    x: Int as int4;
    y: Int as uint3;
}

contract PackedSmall {
    p: Pack;
    init() {
        self.p = Pack{x:7,y:7};
    }
}