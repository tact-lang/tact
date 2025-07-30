struct Complex1 {
    a: Int as int8;
    b: Int?;
    c: String;
    d: Address?;
    e: Cell;
}

struct Complex2 {
    c1: Complex1;
    f: Bool;
}

contract LayeredComplex {
    data: Complex2;

    init() {
        self.data = Complex2{
            c1: Complex1{a:1,b:null,c:"hi",d:null,e:emptyCell()},
            f: true
        };
    }
}