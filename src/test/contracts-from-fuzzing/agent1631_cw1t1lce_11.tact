struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
}

contract UseComplex {
    c1: Complex;
    c2: Complex;

    init() {
        self.c1 = Complex{ a:1, b:true, c:"hi", d:emptyCell(), e:emptyCell().asSlice(), f: myAddress() };
        self.c2 = Complex{ a:2, b:false, c:"bye", d:emptyCell(), e:emptyCell().asSlice(), f: myAddress() };
    }
}