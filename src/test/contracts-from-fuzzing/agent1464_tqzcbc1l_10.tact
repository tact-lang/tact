struct Complex {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Address;
    f: Cell;
    g: Address?;
    h: Cell?;
}

contract TestContract {
    data: Complex;

    init() {
        self.data = Complex{
            a:1, b:true, c:null, d:null,
            e: myAddress(), f: emptyCell(),
            g:null, h:null
        };
    }
}