struct ComplexStruct {
    a: Int;
    b: Bool;
    c: Cell;
}

contract GetterComposite {
    v: Int = 123;
    flag: Bool = true;
    cellField: Cell;

    init() {
        self.cellField = beginCell().storeUint(7, 4).endCell();
    }

    receive() {}

    // Getter that returns a composite struct
    get fun get_complex(): ComplexStruct {
        return ComplexStruct {
            a: self.v,
            b: self.flag,
            c: self.cellField
        };
    }
}
