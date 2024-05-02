struct MyStruct {
    a: Int;
    b: Bool;
}

contract MapTraverseTestContract {
    init() {
        // Nothing to do
    }

    receive() {
        // Nothing to do
    }

    // possible map keys: Int, Address
    // possible map values: Int, Bool, Cell, Address, Struct

    get fun test_int_int(): Int {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        m.set(2, 200);
        m.set(3, 300);
        m.set(4, 400);

        let sum: Int = 0;
        foreach (k, v in m) {
            sum += v;
        }

        return sum;
    }

    get fun test_int_bool(): Int {
        let m: map<Int, Bool> = emptyMap();
        m.set(1, true);
        m.set(2, false);
        m.set(3, true);
        m.set(4, false);

        let sum: Int = 0;
        foreach (k, v in m) {
            if (v) {
                sum += k;
            }
        }

        return sum;
    }

    get fun test_int_cell(): Int {
        let m: map<Int, Cell> = emptyMap();
        m.set(1, beginCell().storeUint(100, 16).endCell());
        m.set(2, beginCell().storeUint(200, 16).endCell());
        m.set(3, beginCell().storeUint(300, 16).endCell());
        m.set(4, beginCell().storeUint(400, 16).endCell());

        let sum: Int = 0;
        foreach (k, v in m) {
            let s: Slice = v.beginParse();
            sum += s.loadUint(16);
        }

        return sum;
    }

    get fun test_int_address(): Int {
        let m: map<Int, Address> = emptyMap();
        m.set(1, newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76873));
        m.set(2, newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76874));
        m.set(3, newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76875));
        m.set(4, newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76876));

        let sum: Int = 0;
        foreach (k, v in m) {
            let s: Slice = beginCell().storeAddress(v).endCell().beginParse();
            s.skipBits(264);
            sum += s.loadUint(3);
        }

        return sum;
    }

    get fun test_int_struct(): Int? {
        // let s: MyStruct = MyStruct{a: 100, b: true};
        // let m: map<Int, MyStruct> = emptyMap();
        // m.set(1, s);
        // let s1: MyStruct = m.get(1)!!;
        // return s1.a;

        let m: map<Int, MyStruct> = emptyMap();
        m.set(1, MyStruct{a: 100, b: true});
        m.set(2, MyStruct{a: 200, b: false});
        m.set(3, MyStruct{a: 300, b: true});
        m.set(4, MyStruct{a: 400, b: false});

        let sum: Int = 0;
        foreach (k, v in m) {
            if (v.b) {
                sum += v.a;
            }
        }

        return sum;
    }
}