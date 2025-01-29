asm(value key self keySize) extends mutates fun nativeUdictStoreUint(self: Cell?, keySize: Int, key: Int, value: Slice) { DICTUSET }

extends mutates fun multiply(self: Int, x: Int): Int {
    self *= x;
    return self;
}

extends fun multiplyExtends(self: Int?, x: Int): Int? {
    if (self == null) {
        return null;
    }
    return self!! * x;
}

struct Foo {
    s: Slice;
}

struct MyStruct {
    age: Int;
}

fun returnMyStruct(): MyStruct {
    return MyStruct{ age: 10 };
}

extends mutates fun setAge(self: MyStruct, age: Int): Int {
    let old = self.age;
    self.age = age;
    return old + self.age;
}

contract Tester {
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

    get fun test10(dict: Cell?): Cell? {
        dict.nativeUdictStoreUint(8, 123, rawSlice("456"));
        return dict;
    }

    get fun test11(x: Int?): Int? {
        x.multiplyExtends(2);
        x.multiplyExtends(2).multiplyExtends(3);
        return x.multiplyExtends(2).multiplyExtends(3);
    }

    get fun test12(): Int {
        return returnMyStruct().setAge(20);
    }
}
