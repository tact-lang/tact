struct StructOne {
    x: Int; y: Bool;
}

struct StructTwo {
    a: Int; b: Bool;
}

contract MultiStructState {
    s1: StructOne;
    s2: StructTwo;

    init() {
        self.s1 = StructOne{ x:1, y:true };
        self.s2 = StructTwo{ a:2, b:false };
    }
}