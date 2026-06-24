struct Inner { a: Int; }
struct Outer { inner: Inner; }

// 8. Getter returning a nested composite type
contract NestedGetter {
    outer: Outer = Outer{ inner: Inner{ a: 100 } };

    receive() {}

    get fun getOuter(): Outer {
        return self.outer;
    }
}

// 9. Getter returning a Cell directly
contract CellGetter {
    c: Cell;
    
    init() {
        self.c = beginCell().storeUint(999, 16).endCell();
    }
    
    receive() {}
    
    get fun getCell(): Cell {
        return self.c;
    }
}
