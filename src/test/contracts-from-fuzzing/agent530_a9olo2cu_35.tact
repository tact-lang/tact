struct Complex {
    x: Int;
    y: Bool;
    z: String;
}

contract StructCopy {
    c1: Complex;
    c2: Complex;

    init() {
        self.c1 = Complex{ x:2,y:true,z:"hi" };
        self.c2 = self.c1;
    }
}
