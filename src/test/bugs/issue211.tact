extends mutates fun multiply(self: Int, x: Int): Int {
    self *= x;
    return self;
}

contract Issue211 {
    init() {}
    receive() {}
    
    get fun test1(): Int {
        let x: Int = beginCell().storeUint(0, 1).endCell().beginParse().loadUint(1);
        return x;
    }

    get fun test2(): Int {
        let y: Cell = beginCell().storeUint(0, 1).endCell();
        let x: Slice = beginCell().storeUint(y.beginParse().loadUint(1), 1).endCell().beginParse();
        return x.loadUint(1);
    }

    get fun test3(): Int {
        let x: Int = 3;
        x.multiply(2);
        return x;
    }

    get fun test4(): Int {
        let x: Int = 3;
        return x.multiply(2).multiply(4);
    }
}