extends mutates fun multiply(self: Int, x: Int): Int {
    self *= x;
    return self;
}

struct Foo {
    s: Slice;
}

contract Issue211 {
    s: Slice;
    
    init() {
        self.s = beginCell().storeUint(3, 2).storeUint(1, 2).endCell().asSlice();
    }
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

    get fun test5(): Int {
        return "abc".asSlice().loadUint(8);
    }

    get fun test6() {
        emptySlice().loadRef();
    }

    get fun test7(): Int {
        return beginCell().storeInt(42, 7).asSlice().loadInt(7);
    }

    get fun test8(): Int {
        let foo: Foo = Foo {
              s: beginCell()
                 .storeUint(3, 2)
                 .storeUint(1, 2)
                 .endCell().asSlice(),  // bits: 1101
            };
        foo.s.loadBits(1); // should mutate foo.s, making it point to 101
        return foo.s.loadUint(3);  // if the previous line mutated foo.s, should return 5, otherwise 6
    }

    get fun test9(): Int {
        self.s.loadUint(1);
        return self.s.loadUint(3);
    }
}