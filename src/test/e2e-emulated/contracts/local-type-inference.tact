import "@stdlib/deploy";

struct MyStruct {
    x: Int;
    y: Int;
}

contract LocalTypeInferenceTester with Deployable {
    get fun test1(): Int {
        let x = 1;
        return x;
    }

    get fun test2(): Int {
        let x = 1;
        let y = x + 1;
        return y;
    }

    get fun test3(): Address {
        let x = myAddress();
        return x;
    }

    get fun test4(): Address {
        let x = myAddress();
        let y = x;
        return y;
    }

    get fun test5(): Bool {
        let x: Int = 123;
        let y = x == 123;
        return y;
    }

    get fun test6(): Slice {
        let x = beginCell().storeUint(123, 64).endCell().asSlice();
        return x;
    }

    get fun test7(): Cell {
        let x = beginCell().storeUint(123, 64).endCell();
        return x;
    }

    get fun test8(): Builder {
        let x = beginCell().storeUint(123, 64);
        return x;
    }

    get fun test9(): String {
        let x = beginString().concat("hello").toString();
        return x;
    }

    get fun test10(): String {
        let x = beginString();
        let y = x.concat("hello").toString();
        return y;
    }

    get fun test11(): StateInit {
        let x = initOf LocalTypeInferenceTester();
        return x;
    }

    get fun test12(): map<Int, Int> {
        let x: map<Int, Int> = emptyMap();
        let y = x;
        return y;
    }

    get fun test13(): map<Int, Int as uint32> {
        let x: map<Int, Int as uint32> = emptyMap();
        let y = x;
        return y;
    }

    get fun test14(): MyStruct {
        let x = MyStruct{ x: 1, y: 2 };
        return x;
    }

    get fun test15(): MyStruct {
        let x = MyStruct{ x: 1, y: 2 };
        let y = x;
        return y;
    }

    get fun test16(): Int? {
        let m: map<Int, Int> = emptyMap();
        let x = m.get(1);
        return x;
    }

    get fun test17(): Int? {
        let m: map<Int, Int> = emptyMap();
        let x = m.get(1);
        let y = x;
        return y;
    }

    get fun test18(): Int? {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 2);
        let x = m.get(1);
        return x;
    }
}