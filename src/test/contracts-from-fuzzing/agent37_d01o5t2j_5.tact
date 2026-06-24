struct Complex {
    i: Int;
    b: Bool;
    s: String;
    addr: Address;
    c: Cell;
}

contract MixStruct {
    persist: Complex;
    init() {
        self.persist = Complex{
            i: 1,
            b: true,
            s: "ok",
            addr: myAddress(),
            c: emptyCell(),
        };
    }
}