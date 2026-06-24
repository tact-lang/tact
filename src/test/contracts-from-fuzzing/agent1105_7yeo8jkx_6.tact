struct MiddleA { f1: Int; f2: Int?; }
struct MiddleB { f3: Bool; f4: Bool?; }
struct Complex {
    a: MiddleA;
    b: MiddleB;
    s: String;
    sOpt: String?;
    addr: Address;
    addrOpt: Address?;
    cell: Cell;
    cellOpt: Cell?;
}

contract ManyNested {
    c: Complex;
    init() {
        self.c = Complex{
            a: MiddleA{f1:1,f2:null},
            b: MiddleB{f3:true,f4:null},
            s: "x",
            sOpt: null,
            addr: myAddress(),
            addrOpt: null,
            cell: emptyCell(),
            cellOpt: null
        };
    }
}