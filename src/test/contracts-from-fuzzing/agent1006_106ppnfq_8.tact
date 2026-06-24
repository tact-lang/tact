struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: String?;
}

contract ComplexContract {
    storage: Complex;

    init() {
        self.storage = Complex{
            a: 42, b:false, c:"hello", d:myAddress(), e:emptyCell(),
            f:emptyCell().asSlice(), g:null, h:true, i:null
        };
    }
}
