struct One { number: Int; }

struct Params {
    name: String = "Satoshi";
    age: Int?;
    val: One;
}

message MyMsg { someVal: Int as uint8; }

extends fun toStr(self: Int): String {
    return self.toFloatString(9);
}

contract TestCompositeTypes {
    fun testMap() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        m.set(1, 200);
        dump(m.get(1)!!);         // Expected output: 200
        dump(m.del(1));           // Expected output: true
        dump(m.exists(1));        // Expected output: false
    }

    fun testStruct() {
        let a: One = One { number: 50 };
        let p: Params = Params { val: a };
        dump(p.name);             // Expected: "Satoshi"
        dump(p.val.number);       // Expected: 50
        let cellVal: Cell = p.toCell();
        let p2: Params = Params.fromCell(cellVal);
        dump(p2.val.number);      // Expected: 50
    }

    fun testMessage() {
        let msg: MyMsg = MyMsg { someVal: 42 };
        let cellMsg: Cell = msg.toCell();
        let msg2: MyMsg = MyMsg.fromCell(cellMsg);
        dump(msg2.someVal);       // Expected: 42
    }

    fun testExtension() {
        let s: String = 100.toStr();
        dump(s);                  // Expected: 0.000000100 (with 9 decimal precision formatting)
    }

    receive() {
        self.testMap();
        self.testStruct();
        self.testMessage();
        self.testExtension();
    }
}
