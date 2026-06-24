struct Point {
    x: Int;
    y: Int;
}

struct Complex {
    a: Int;
    b: Bool;
    c: Point;
    d: Bool?;
    e: String;
    f: Address;
    g: Cell;
    h: Slice;
    i: String?;
    j: Address?;
}

contract ComplexFields {
    data: Complex;

    init() {
        self.data = Complex{
            a:1, b:true, c:Point{x:1,y:2}, d:null, e:"hi",
            f:myAddress(), g:emptyCell(), h:emptyCell().asSlice(), i:null, j:null
        };
    }
}