struct Complex {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    a: Address;
    optI: Int?;
    optB: Bool?;
    optS: String?;
    optC: Cell?;
    optA: Address?;
}

contract MultiType {
    f: Complex;

    init() {
        self.f = Complex{
            i:1, b:true, s:"s", c: emptyCell(), a: myAddress(),
            optI: null, optB: null, optS: null, optC: null, optA: null
        };
    }
}