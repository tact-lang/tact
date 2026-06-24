struct Complex {
    a: Int;
    b: Bool;
    c: Address?;
    d: String;
    e: Cell;
    f: Builder?;
    g: Slice;
    h: Inner;
}

struct Inner {
    x: Int;
    y: Bool?;
}

contract Test14 {
    comp: Complex;

    init() {
        self.comp = Complex{
            a:1,b:true,c:null,d:"hi",e:emptyCell(),f:null,g:emptyCell().asSlice(),
            h: Inner{ x:5, y:null }
        };
    }
}