struct Variants {
    x:Int as int8;
    y:Int as uint8;
    z:Int;
}

contract SerializeCombos {
    s: Variants;
    init() {
        self.s = Variants{ x:-5, y:200, z:999 };
    }
}
