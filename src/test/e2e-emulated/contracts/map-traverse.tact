struct MyStruct {
    a: Int;
    b: Bool;
}

struct MyStructWithMap {
    m: map<Int, Int>;
}

contract MapTraverseTestContract {
    m: map<Int, Int>;
    s: MyStructWithMap;

    init() {
        self.m = emptyMap();
        self.m.set(1, 100);
        self.m.set(2, 200);
        self.m.set(3, 300);

        self.s = MyStructWithMap{m: self.m};
    }

    receive() {
        // Nothing to do
    }

    get fun test_int_int(): Int {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        m.set(2, 200);
        m.set(3, 300);
        m.set(4, 400);

        let sum1: Int = 0;
        let sum2: Int = 0;
        foreach (k, v in m) {
            sum1 += k;
            sum2 += v;
        }

        return sum1 + sum2;
    }

    get fun test_int_bool(): Int {
        let m: map<Int, Bool> = emptyMap();
        m.set(1, true);
        m.set(2, false);
        m.set(3, true);
        m.set(4, false);

        let sum11: Int = 0;
        let sum12: Int = 0;
        let sum21: Int = 0;
        foreach (k, v in m) {
            if (v) {
                sum11 += k;
                sum12 += 1;
            } else {
                sum21 += k;
            }
        }

        return sum11 + sum12 + sum21;
    }

    get fun test_int_cell(): Int {
        let m: map<Int, Cell> = emptyMap();
        m.set(1, beginCell().storeUint(100, 16).endCell());
        m.set(2, beginCell().storeUint(200, 16).endCell());
        m.set(3, beginCell().storeUint(300, 16).endCell());
        m.set(4, beginCell().storeUint(400, 16).endCell());

        let sum1: Int = 0;
        let sum2: Int = 0;
        foreach (k, v in m) {
            let s: Slice = v.beginParse();
            sum1 += k;
            sum2 += s.loadUint(16);
        }

        return sum1 + sum2;
    }

    get fun test_int_address(): Int {
        let m: map<Int, Address> = emptyMap();
        m.set(1, newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76873));
        m.set(2, newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76874));
        m.set(3, newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76875));
        m.set(4, newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76876));

        let sum1: Int = 0;
        let sum2: Int = 0;
        foreach (k, v in m) {
            let s: Slice = beginCell().storeAddress(v).endCell().beginParse();
            s.skipBits(264);
            sum1 += k;
            sum2 += s.loadUint(3);
        }

        return sum1 + sum2;
    }

    get fun test_int_struct(): Int {
        let m: map<Int, MyStruct> = emptyMap();
        m.set(1, MyStruct{a: 100, b: true});
        m.set(2, MyStruct{a: 200, b: false});
        m.set(3, MyStruct{a: 300, b: true});
        m.set(4, MyStruct{a: 400, b: false});

        let sum11: Int = 0;
        let sum12: Int = 0;
        let sum21: Int = 0;
        let sum22: Int = 0;
        foreach (k, v in m) {
            if (v.b) {
                sum11 += k;
                sum12 += v.a;
            } else {
                sum21 += k;
                sum22 += v.a;
            }
        }

        return sum11 + sum12 + sum21 + sum22;
    }

    get fun test_address_int(): Int {
        let m: map<Address, Int> = emptyMap();
        m.set(newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76873), 100);
        m.set(newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76874), 200);
        m.set(newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76875), 300);
        m.set(newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76876), 400);

        let sum1: Int = 0;
        let sum2: Int = 0;
        foreach (k, v in m) {
            let s: Slice = beginCell().storeAddress(k).endCell().beginParse();
            s.skipBits(264);
            sum1 += s.loadUint(3);
            sum2 += v;
        }
        
        return sum1 + sum2;
    }

    get fun test_address_bool(): Int {
        let m: map<Address, Bool> = emptyMap();
        m.set(newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76873), true);
        m.set(newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76874), false);
        m.set(newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76875), true);
        m.set(newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76876), false);

        let sum11: Int = 0;
        let sum12: Int = 0;
        let sum21: Int = 0;
        foreach (k, v in m) {
            let s: Slice = beginCell().storeAddress(k).endCell().beginParse();
            s.skipBits(264);
            if (v) {
                sum11 += s.loadUint(3);
                sum12 += 1;
            } else {
                sum21 += s.loadUint(3);
            }
        }

        return sum11 + sum12 + sum21;
    }

    get fun test_address_cell(): Int {
        let m: map<Address, Cell> = emptyMap();
        m.set(newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76873), beginCell().storeUint(100, 16).endCell());
        m.set(newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76874), beginCell().storeUint(200, 16).endCell());
        m.set(newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76875), beginCell().storeUint(300, 16).endCell());
        m.set(newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76876), beginCell().storeUint(400, 16).endCell());

        let sum1: Int = 0;
        let sum2: Int = 0;
        foreach (k, v in m) {
            let s: Slice = beginCell().storeAddress(k).endCell().beginParse();
            s.skipBits(264);
            sum1 += s.loadUint(3);
            let vs: Slice = v.beginParse();
            sum2 += vs.loadUint(16);
        }

        return sum1 + sum2;
    }

    get fun test_address_address(): Int {
        let m: map<Address, Address> = emptyMap();
        m.set(newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76873), newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76874));
        m.set(newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76875), newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76876));
        m.set(newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76877), newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76878));
        m.set(newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76879), newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76880));

        let sum1: Int = 0;
        let sum2: Int = 0;
        foreach (k, v in m) {
            let s1: Slice = beginCell().storeAddress(k).endCell().beginParse();
            s1.skipBits(264);
            sum1 += s1.loadUint(3);
            let s2: Slice = beginCell().storeAddress(v).endCell().beginParse();
            s2.skipBits(264);
            sum2 += s2.loadUint(3);
        }

        return sum1 + sum2;
    }

    get fun test_address_struct(): Int {
        let m: map<Address, MyStruct> = emptyMap();
        m.set(newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76873), MyStruct{a: 100, b: true});
        m.set(newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76874), MyStruct{a: 200, b: false});
        m.set(newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76875), MyStruct{a: 300, b: true});
        m.set(newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76876), MyStruct{a: 400, b: false});

        let sum11: Int = 0;
        let sum12: Int = 0;
        let sum21: Int = 0;
        let sum22: Int = 0;
        foreach (k, v in m) {
            let s: Slice = beginCell().storeAddress(k).endCell().beginParse();
            s.skipBits(264);
            if (v.b) {
                sum11 += s.loadUint(3);
                sum12 += v.a;
            } else {
                sum21 += s.loadUint(3);
                sum22 += v.a;
            }
        }

        return sum11 + sum12 + sum21 + sum22;
    }

    get fun test_empty_map(): Int {
        let m: map<Int, Int> = emptyMap();
        let sum: Int = 0;
        foreach (k, v in m) {
            return 42;
        }
        return sum;
    }

    get fun test_null(): Int {
        let m: map<Int, Int> = null;
        let sum: Int = 0;
        foreach (k, v in m) {
            return 42;
        }
        return sum;
    }

    get fun test_map_modification_during_traversal1(): Int {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        m.set(2, 200);
        m.set(3, 300);
        m.set(4, 400);
        let sum: Int = 0;
        foreach (k, v in m) {
            m.del(2);
            sum += k + v;
        }
        return sum;
    }

    // out of gas: always inserts a new key during traversal
    get fun test_map_modification_during_traversal2() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        let sum: Int = 0;
        foreach (k, v in m) {
            m.set(k + 1, v + 1);
        }
    }

    // map size: we actually cannot express this as a user-defined function
    // because we don't have bounded polymorphism in the language
    get fun test_map_size(): Int {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        m.set(2, 200);
        m.set(3, 300);
        m.set(4, 400);
        let size: Int = 0;
        foreach (k, v in m) {
            size += 1;
        }
        return size;
    }

    get fun test_map_as_field(): Int {
        let sum: Int = 0;
        foreach (k, v in self.m) {
            sum += k + v;
        }
        return sum;
    }

    get fun test_map_as_struct_field(): Int {
        let sum: Int = 0;
        foreach (k, v in self.s.m) {
            sum += k + v;
        }
        return sum;
    }
}