struct Complex {
    x: Int;
    y: Int?;
    z: Int;
}

contract Holding {
    c: Complex;
    init() {
        self.c = Complex{ x:1,y:null,z:2 };
    }
}