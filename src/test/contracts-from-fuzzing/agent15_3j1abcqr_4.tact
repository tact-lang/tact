struct One { number: Int; }

struct Params {
    name: String = "Satoshi";
    age: Int?;
    val: One;
}

message MyMsg { someVal: Int as uint8; }

contract TestStructs {
    fun run() {
        // Test struct instantiation and default values
        let o: One = One{ number: 50 };
        let p: Params = Params{ val: o };
        dump(p.name); // Expected: "Satoshi"
        if (p.age == null) {
            dump("age is null");
        }
        dump(p.val.number); // Expected: 50

        // Test message struct: convert to Cell and back
        let m: MyMsg = MyMsg{ someVal: 42 };
        let mcell: Cell = m.toCell();
        dump(mcell);
        let m2: MyMsg = MyMsg.fromCell(mcell);
        dump(m2.someVal); // Expected: 42
    }
    
    receive() {}
}
