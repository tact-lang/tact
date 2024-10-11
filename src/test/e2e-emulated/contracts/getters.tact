import "@stdlib/deploy";

struct S {
    a: Int;
    b: Int;
}

message SetIdAndData {
    id: Int;
    data: Cell;
}

const METHOD_ID: Int = 16384;

contract Test with Deployable {
    id: Int as uint32 = 0;
    anotherData: Cell;

    init() {
        self.anotherData = beginCell().endCell();
    }

    receive(msg: SetIdAndData) {
        self.id = msg.id;
        self.anotherData = msg.data;
    }

    get fun testGetter(): Int {
        return 1;
    }

    get fun test_getter(): Int {
        return 2;
    }

    get fun Test_getter(): Int {
        return 3;
    }

    get fun contractData(): Test {
        return self;
    }

    get fun structAsInput(s: S): S {
        return s;
    }

    get fun messageAsInput1(m: SetIdAndData): Int {
        return m.id;
    }

    get fun messageAsInput2(m: SetIdAndData): SetIdAndData {
        return m;
    }

    get fun contractAsInput(test: Test): Test {
        return test;
    }

    // method ids are 19 bit signed integers
    // so we truncate the result with a (18-bit) bit mask
    get((crc32("methodId") + 42) & 0b111111111111111111) fun methodIdExpr(): Bool {
        return true;
    }
    get(METHOD_ID) fun methodIdConst(): Int {
        return METHOD_ID;
    }
    get(-pow2(18)) fun methodIdMin(): Bool {
        return true;
    }
    get(pow2(18) - 1) fun methodIdMax(): Bool {
        return true;
    }
}